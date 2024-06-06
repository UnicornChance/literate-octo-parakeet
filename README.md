# UDS docs

[![CI Status](https://github.com/defenseunicorns/uds/actions/workflows/ci.yaml/badge.svg)](https://github.com/defenseunicorns/uds/actions)

[![Netlify Status](https://api.netlify.com/api/v1/badges/b53b7c74-fd71-4a21-8077-6c06b3fab74d/deploy-status)](https://app.netlify.com/sites/uds/deploys)

This site uses the [Defense Unicorns](https://github.com/defenseunicorns/defense-unicorns-hugo-theme) theme for Hugo
which is a fork of the Google Docsy theme. The Docsy documentation can be used as a guide for [building content](https://www.docsy.dev/docs/adding-content/).

## Contributing

This repository enforces [Conventional Commit](https://www.conventionalcommits.org/en/v1.0.0/) messages. See the
documentation for [`release-please`](https://github.com/googleapis/release-please#how-should-i-write-my-commits) for
correctly formatting commit messages

## Getting Started

Clone this repository

```bash
git clone git@github.com:defenseunicorns/uds.git
cd uds
npm ci
```

To run the site for local development:

```bash
npm start
```

Then navigate to [http://localhost:1313/](http://localhost:1313/)

## Deploy to production

See [Production Deploy](https://github.com/defenseunicorns/company-website/blob/main/doc/production-deploy.md) for
details.
