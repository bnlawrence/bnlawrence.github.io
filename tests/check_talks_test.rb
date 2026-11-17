require 'fileutils'
require 'minitest/autorun'
require 'open3'
require 'tmpdir'

class CheckTalksTest < Minitest::Test
  def setup
    @root = Dir.mktmpdir('check-talks-')
    FileUtils.cp(File.expand_path('../check_talks.sh', __dir__), @root)
    FileUtils.mkdir_p("#{@root}/_posts/talks")
    FileUtils.mkdir_p("#{@root}/assets/images")
    FileUtils.mkdir_p("#{@root}/assets/talks")
    File.write("#{@root}/assets/images/example.png", '')
    File.write("#{@root}/assets/talks/example.pdf", '')
  end

  def teardown
    FileUtils.remove_entry(@root)
  end

  def post(image: '/assets/images/example.png', body: 'Presentation: [pdf](/assets/talks/example.pdf)', yaml: nil)
    yaml ||= "image: #{image}\n"
    File.write("#{@root}/_posts/talks/example.md", "---\n#{yaml}---\n#{body}\n")
  end

  def run_check(*args)
    Open3.capture3('sh', "#{@root}/check_talks.sh", *args, chdir: @root)
  end

  def test_valid_post_and_liquid_links
    post(body: 'Presentation: [pdf]({{"assets/talks/example.pdf" | absolute_url}})')
    out, err, status = run_check
    assert status.success?, err
    assert_includes out, '1 talk post(s): 0 error(s)'
  end

  def test_selected_file_from_another_directory
    post
    _, err, status = Open3.capture3('sh', "#{@root}/check_talks.sh",
                                  "#{@root}/_posts/talks/example.md", chdir: '/')
    assert status.success?, err
  end

  def test_missing_image_field_and_presentation_file
    post(yaml: "title: Example\n", body: 'Presentation: [pdf](/assets/talks/missing.pdf)')
    _, err, status = run_check
    refute status.success?
    assert_includes err, 'missing or invalid image field'
    assert_includes err, 'presentation: file not found'
  end

  def test_missing_image_file_and_presentation_link
    post(image: '/assets/images/missing.png', body: 'No slides yet.')
    _, err, status = run_check
    refute status.success?
    assert_includes err, 'image: file not found'
    assert_includes err, 'missing Presentation:'
  end

  def test_checks_every_presentation
    post(body: "Presentation: [pdf](/assets/talks/example.pdf)\nPresentation: [pdf](/assets/talks/missing.pdf)")
    _, err, status = run_check
    refute status.success?
    assert_includes err, 'missing.pdf'
  end

  def test_invalid_yaml_is_reported
    post(yaml: "image: [\n")
    _, err, status = run_check
    refute status.success?
    assert_includes err, 'invalid YAML'
  end

  def test_remote_asset_is_not_silently_accepted
    post(image: 'https://example.com/image.png')
    _, err, status = run_check
    refute status.success?
    assert_includes err, 'expected a local asset'
  end

  def test_no_posts_is_an_error
    _, err, status = run_check
    refute status.success?
    assert_includes err, 'No talk posts found'
  end
end
