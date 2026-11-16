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
