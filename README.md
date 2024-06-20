# UDS docs

[![CI Status](https://github.com/defenseunicorns/uds/actions/workflows/ci.yaml/badge.svg)](https://github.com/defenseunicorns/uds/actions)

[![Netlify Status](https://api.netlify.com/api/v1/badges/b53b7c74-fd71-4a21-8077-6c06b3fab74d/deploy-status)](https://app.netlify.com/sites/uds/deploys)

This site uses the [Defense Unicorns](https://github.com/defenseunicorns/defense-unicorns-hugo-theme) theme for Hugo
which is a fork of the Google Docsy theme. The Docsy documentation can be used as a guide for [building content](https://www.docsy.dev/docs/adding-content/).

## Adding content

This repository does not contain any content. Instead, it uses the [documentation from the uds-core project](https://github.com/defenseunicorns/uds-core/tree/main/docs) repository and
[transforms it during the build](scripts/update_docs.sh) into markdown that Hugo can understand. Because of this, there are certain standards required for the documentation to be published correctly.

1. Currently, only documentation in the `docs` folder will be published.
2. There must be at least one `README.md` or `index.md` index file. This file acts as the menu header. It can contain
   text or not, but it must at least have an H1 with the menu title. If the file exists in `docs` then all other files will be
   treated as child documents.
   ex:

```bash
/docs
    README.md
```

If there is a need for multiple menu items, then make sure there is no index file in the
   `docs` folder and create folders under `docs` that each have an index file and their children will be sub-sections of
   that menu.

```bash
/docs
    /menu1
        README.md
    /menu2
        README.md
```

## Adding a new Repo
```bash
git submodule add -b main https://github.com/UnicornChance/ideal-eureka.git submodules/ideal-eureka
```


## Publishing

Publishing content is automatic. This repository includes uds-core as a git submodule. It is using Renovate to monitor
changes to uds-core. Any change to uds-core `main` will trigger Renovate to do an update and publish to Netlify.