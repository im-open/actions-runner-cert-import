# DEPRECATED

This action was deprecated on 2023-09-08 and will no longer receive support or updates.

# Actions Runner Cert Import

This action will import a certificate to a windows actions runner.

## Index <!-- omit in toc -->

- [Actions Runner Cert Import](#actions-runner-cert-import)
  - [Inputs](#inputs)
  - [Usage Examples](#usage-examples)
    - [Simple](#simple)
    - [Password Protected](#password-protected)
  - [Contributing](#contributing)
    - [Incrementing the Version](#incrementing-the-version)
    - [Source Code Changes](#source-code-changes)
    - [Updating the README.md](#updating-the-readmemd)
  - [Code of Conduct](#code-of-conduct)
  - [License](#license)

## Inputs

| Parameter       | Is Required | Description                                                          |
|-----------------|-------------|----------------------------------------------------------------------|
| `cert-path`     | true        | Import cert path, for example "./certs/cert.pfx\"                    |
| `cert-store`    | true        | Cert store import location, for example "Cert:\LocalMachine\My"      |
| `cert-password` | false       | The key value to use if the cert is locked                           |
| `is-pfx-cert`   | false       | Specifies if a cert is contains a private key, expects true or false |

## Usage Examples

### Simple

```yml
jobs:
  import-cert-on-runner:
    runs-on: [windows-2019]
    steps:
      - uses: actions/checkout@v3

      - name: Import Runner Cert
        # You may also reference the major or major.minor version
        uses: im-open/action-runner-cert-import@v1.0.2
        with:
          cert-path: './certs/cert.cer'
          cert-store: 'Cert:\LocalMachine\My'
```

### Password Protected

```yml
jobs:
  import-cert-on-runner:
    runs-on: [windows-2019]
    steps:
      - uses: actions/checkout@v3

      - name: Import Runner Cert
        # You may also reference the major or major.minor version
        uses: im-open/action-runner-cert-import@v1.0.2
        with:
          cert-path: './certs/cert.pfx'
          cert-store: 'Cert:\LocalMachine\Root'
          cert-password: '${{ secrets.cert_password }}'
          is-pfx-cert: true
```

## Contributing

When creating PRs, please review the following guidelines:

- [ ] The action code does not contain sensitive information.
- [ ] At least one of the commit messages contains the appropriate `+semver:` keywords listed under [Incrementing the Version] for major and minor increments.
- [ ] The README.md has been updated with the latest version of the action.  See [Updating the README.md] for details.

### Incrementing the Version

This repo uses [git-version-lite] in its workflows to examine commit messages to determine whether to perform a major, minor or patch increment on merge if [source code] changes have been made.  The following table provides the fragment that should be included in a commit message to active different increment strategies.

| Increment Type | Commit Message Fragment                     |
|----------------|---------------------------------------------|
| major          | +semver:breaking                            |
| major          | +semver:major                               |
| minor          | +semver:feature                             |
| minor          | +semver:minor                               |
| patch          | *default increment type, no comment needed* |

### Source Code Changes

The files and directories that are considered source code are listed in the `files-with-code` and `dirs-with-code` arguments in both the [build-and-review-pr] and [increment-version-on-merge] workflows.  

If a PR contains source code changes, the README.md should be updated with the latest action version.  The [build-and-review-pr] workflow will ensure these steps are performed when they are required.  The workflow will provide instructions for completing these steps if the PR Author does not initially complete them.

If a PR consists solely of non-source code changes like changes to the `README.md` or workflows under `./.github/workflows`, version updates do not need to be performed.

### Updating the README.md

If changes are made to the action's [source code], the [usage examples] section of this file should be updated with the next version of the action.  Each instance of this action should be updated.  This helps users know what the latest tag is without having to navigate to the Tags page of the repository.  See [Incrementing the Version] for details on how to determine what the next version will be or consult the first workflow run for the PR which will also calculate the next version.

## Code of Conduct

This project has adopted the [im-open's Code of Conduct](https://github.com/im-open/.github/blob/main/CODE_OF_CONDUCT.md).

## License

Copyright &copy; 2023, Extend Health, LLC. Code released under the [MIT license](LICENSE).

<!-- Links -->
[Incrementing the Version]: #incrementing-the-version
[Updating the README.md]: #updating-the-readmemd
[source code]: #source-code-changes
[usage examples]: #usage-examples
[build-and-review-pr]: ./.github/workflows/build-and-review-pr.yml
[increment-version-on-merge]: ./.github/workflows/increment-version-on-merge.yml
[git-version-lite]: https://github.com/im-open/git-version-lite
