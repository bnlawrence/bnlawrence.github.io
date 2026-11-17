# Publishing the site

The `source` branch contains the Jekyll source. GitHub Actions builds it with
the plugins in `Gemfile` and publishes the result to GitHub Pages. The workflow
uses `_config-deploy.yml`, including the production domain.

## Initial setup

Before enabling automated deployment, make sure the `source` branch on GitHub
contains the current site. The local source has uncommitted changes and files
that are not yet on GitHub; deploying an older source would replace the current
live site with an older build. Review and commit the desired content, assets,
`Gemfile`, `Gemfile.lock`, deployment configuration, and workflow, then push
them to `source`.

In the repository's **Settings > Pages**, set **Build and deployment > Source**
to **GitHub Actions**. Keep the existing custom domain configured. Once the
source is up to date and the setting is enabled, run **Build and deploy site**
from the Actions tab with the `source` branch selected. Check the workflow and
the live site before relying on automatic deployments.

The workflow publishes directly to Pages; it does not update the `master`
branch or the separate `github-deployed` checkout.

## Posting

Add a Markdown file named `YYYY-MM-DD-title.md` under `_posts/` on the `source`
branch, with front matter like:

```yaml
---
layout: post
title: "Your title"
categories: computing
tags: example
---
```

Add the post text after the front matter and commit the file to `source`.
Every push to that branch triggers a build and deployment. The Actions tab
shows progress and any errors. Changes to other site files work the same way;
there is no need to upload a locally built site.

## Checking talk assets

Run `./check_talks.sh` before committing a talk. It checks every Markdown post
under `_posts/talks/` for a nonempty YAML `image` field, an existing image file,
and at least one `Presentation: [pdf](...)` link whose target exists. Multiple
presentations are checked, including the older `absolute_url` link format.
Asset paths are relative to the site source root, with an optional leading `/`.
Remote asset URLs and unsupported Liquid expressions are reported as errors
rather than assumed to exist. The script does not check external websites.

To check just one post:

```sh
./check_talks.sh _posts/talks/2025-02-14-canari.md
```

The script requires Ruby (already needed by Jekyll), but no installed gems.
It reports all problems and exits with status 1 if any are found, or 0 on success.
Run its regression tests with `ruby tests/check_talks_test.rb`.

## Browser dependencies

Site search uses `js/simple-jekyll-search.min.js` and does not require jQuery.
The retired Staticman comment integration and unused jQuery-dependent scripts
have been removed; there is no longer a locally bundled jQuery dependency.
