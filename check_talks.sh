#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
exec ruby -EUTF-8 - "$script_dir" "$@" <<'RUBY'
require 'date'
require 'pathname'
require 'uri'
require 'yaml'

root = Pathname.new(ARGV.shift)
files = ARGV.empty? ? Dir[root.join('_posts/talks/**/*.{md,markdown}').to_s].sort : ARGV
abort 'ERROR: No talk posts found.' if files.empty?
errors = 0

report = lambda do |file, message|
  warn "#{file}: #{message}"
  errors += 1
end

check_asset = lambda do |file, value, kind|
  if value.match?(/\{\{|\{%/)
    report.call(file, "#{kind}: unsupported Liquid expression: #{value}")
    next
  end
  path = value.split(/[?#]/, 2).first.to_s
  if path.match?(/\A(?:[a-z][a-z0-9+.-]*:|\/\/)/i)
    report.call(file, "#{kind}: expected a local asset, not a remote URL: #{value}")
    next
  end
  path = URI::DEFAULT_PARSER.unescape(path).sub(%r{\A/}, '')
  asset = root.join(path).cleanpath
  unless asset.to_s.start_with?("#{root}/") && asset.file?
    report.call(file, "#{kind}: file not found: #{value}")
  end
end

files.each do |name|
  file = Pathname.new(name).expand_path
  label = file.relative_path_from(root).to_s
  unless file.file?
    report.call(label, 'post file not found')
    next
  end
  text = file.read(encoding: 'UTF-8')
  front_matter = text.match(/\A---\r?\n(.*?)^---[ \t]*\r?$(.*)\z/m)
  unless front_matter
    report.call(label, 'missing or unclosed YAML front matter')
    next
  end
  begin
    data = YAML.safe_load(front_matter[1], permitted_classes: [Date, Time], aliases: false)
  rescue Psych::Exception => e
    report.call(label, "invalid YAML: #{e.message}")
    next
  end
  unless data.is_a?(Hash)
    report.call(label, 'YAML front matter must be a mapping')
    next
  end
  image = data['image']
  if !image.is_a?(String) || image.strip.empty?
    report.call(label, 'missing or invalid image field in YAML')
  else
    check_asset.call(label, image.strip, 'image')
  end

  # Resolve the literal URL expressions used by older talk posts.
  body = front_matter[2].gsub(/\{\{\s*(['"])(.*?)\1\s*\|\s*(?:absolute_url|relative_url)\s*\}\}/) { Regexp.last_match(2) }
  presentations = body.scan(/Presentation:\s*\[[^\]]+\]\(([^)\r\n]+)\)/i).flatten
  if presentations.empty?
    report.call(label, 'missing Presentation: [pdf](...) link')
  end
  presentations.uniq.each do |target|
    target = target.strip.sub(/\A<([^>]+)>\z/, '\1')
    check_asset.call(label, target, 'presentation')
  end
end

puts "Checked #{files.length} talk post(s): #{errors} error(s)."
exit(errors.zero? ? 0 : 1)
RUBY
