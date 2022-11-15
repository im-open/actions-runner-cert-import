# Actions Runner Cert Import

This action will import a certificate to a windows actions runner.

## Index <!-- omit in toc -->

- [Inputs](#inputs)
- [Examples](#examples)
  - [Simple](#simple)
  - [Password Protected](#password-protected)
- [Contributing](#contributing)
  - [Incrementing the Version](#incrementing-the-version)
- [Code of Conduct](#code-of-conduct)
- [License](#license)

## Inputs

| Parameter       | Is Required | Description                                                          |
| --------------- | ----------- | -------------------------------------------------------------------- |
| `cert-path`     | true        | Import cert path, for example "./certs/cert.pfx\"                    |
| `cert-store`    | true        | Cert store import location, for example "Cert:\LocalMachine\My"      |
| `cert-password` | false       | The key value to use if the cert is locked                           |
| `is-pfx-cert`   | false       | Specifies if a cert is contains a private key, expects true or false |

## Examples

### Simple

```yml
jobs:
  import-cert-on-runner:
    runs-on: [windows-2019]
    steps:
      - uses: actions/checkout@v3

      - name: Import Runner Cert
        uses: im-open/action-runner-cert-import@v1.0.0
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
        uses: im-open/action-runner-cert-import@v1.0.0
        with:
          cert-path: './certs/cert.pfx'
          cert-store: 'Cert:\LocalMachine\Root'
          cert-password: '${{ secrets.cert_password }}'
          is-pfx-cert: true
```

## Contributing

When creating new PRs please ensure:

1. For major or minor changes, at least one of the commit messages contains the appropriate `+semver:` keywords listed under [Incrementing the Version](#incrementing-the-version).
1. The action code does not contain sensitive information.

When a pull request is created and there are changes to code-specific files and folders, the `auto-update-readme` workflow will run.  The workflow will update the action-examples in the README.md if they have not been updated manually by the PR author. The following files and folders contain action code and will trigger the automatic updates:

- `action.yml`
- `import-cert.ps1`

There may be some instances where the bot does not have permission to push changes back to the branch though so this step should be done manually for those branches. See [Incrementing the Version](#incrementing-the-version) for more details.

### Incrementing the Version

The `auto-update-readme` and PR merge workflows will use the strategies below to determine what the next version will be.  If the `auto-update-readme` workflow was not able to automatically update the README.md action-examples with the next version, the README.md should be updated manually as part of the PR using that calculated version.

This action uses [git-version-lite] to examine commit messages to determine whether to perform a major, minor or patch increment on merge. The following table provides the fragment that should be included in a commit message to active different increment strategies.
| Increment Type | Commit Message Fragment |
| -------------- | ------------------------------------------- |
| major | +semver:breaking |
| major | +semver:major |
| minor | +semver:feature |
| minor | +semver:minor |
| patch          | *default increment type, no comment needed* |

## Code of Conduct

This project has adopted the [im-open's Code of Conduct](https://github.com/im-open/.github/blob/master/CODE_OF_CONDUCT.md).

## License

Copyright &copy; 2021, Extend Health, LLC. Code released under the [MIT license](LICENSE).

[git-version-lite]: https://github.com/im-open/git-version-lite
