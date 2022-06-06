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

## Contributing

This is an informational archive of current and past configuration. It's not
intended to change often, and should change only as part of official Nomad
governance actions. To contribute, add all outputs of a deployment process to a
**new subfolder** in `archive/`, and if necessary, update the top-level configs

## Contributing (for Nomad Employees)

### Pre-deploy:

We want a precise record of when a config was created and why

- Check out a new branch
- Copy the root-level config to a new file in `pending_deploys/`
- Extend the config
- Make a PR and get it merged 💪

### Deploying

Deploys should be run from an already-committed config file, present in
`pending_deploys/`. We want to reserve ALL information about the deploy you're
running :)

- Check out a new branch
- Create a **new folder** for your deploy in `archive/`
- Invoke the deploy script, targeting your config in `pending_deploys/`
- Copy all deploy outputs to your new folder
  - verification details
  - governance actions
  - output deploy file
- Move your input config to your new folder
- Make a PR and get it merged 💪

### Post-deploy

We want to be careful about updating the canonical configs. They should be
chosen from already-committed deploy outputs.

- Check out a new branch
- **Copy** your deploy's config from `archive/` to the root level
- Overwrite the appropriate env config
- Make a PR and get it merged 💪

## Distribution

This repository is intended to be published as a github pages site. Current env
configs will be made available at static paths in that site. These paths may be
safely hardcoded in the Nomad SDK and agents.
