# Config

Nomad configuration file distribution and archive.

This repository hosts current and past configuration files for Nomad envs. The
SDK and other Nomad applications may pull their configuration from here. This
repo is intended to be a snapshot of the current state of the Nomad deployments
on many chains to ensure that applications have the latest info. It is not
intended to provide versioning, although that may come later

- production https://nomad-xyz.github.io/config/production.json
- staging https://nomad-xyz.github.io/config/staging.json
- development https://nomad-xyz.github.io/config/development.json

## Layout

The top-level repository contains json files for `production`, `development`,
and `staging`. The `archive` directory contains past deployment artifacts.

## Setup

Follow the steps below to have the sort config script run automatically pre-commit

1. Set the hooks path to the committed hooks folder

```bash
git config core.hooksPath hooks/
```

2. Disable the ignored hook warning for the pre-commit hook

```bash
git config advice.ignoredHook false
```

## Contributing

This is an informational archive of current and past configuration. It's not
intended to change often, and should change only as part of official Nomad
governance actions. To contribute, add all outputs of a deployment process to a
**new subfolder** in `archive/`, and if necessary, update the top-level configs

## Distribution

This repository is intended to be published as a github pages site. Current env
configs will be made available at static paths in that site. These paths may be
safely hardcoded in the Nomad SDK and agents.
