# Atomicjar Homebrew Tap

[![hombrew tap atomicjar][homebrew_tap_badge]][homebrew_tap_url]

More installation options are available at [Testcontainers Desktop][tcd_landing] or the Testcontainers Cloud [downloads][web_downloads] page.

## Casks

### `testcontainers-desktop`  <img src="https://img.shields.io/badge/testcontainers--desktop-latest-orange?style=flat-square&color=FBB040" align="right"/>

Testcontainers Desktop application

```
brew install atomicjar/tap/testcontainers-desktop
```
#### OR

```
brew tap atomicjar/tap
brew install testcontainers-desktop
```

### Deprecated: `testcontainers-cloud-desktop`
This cask is **deprecated** in favor of `testcontainers-desktop`. If you have `testcontainers-cloud-desktop` installed, please uninstall and migrate to the new cask:
```
brew uninstall testcontainers-cloud-desktop
brew install testcontainers-desktop
```

## Updating the version of the cask

This tap is a regular git repository and could be navigated using `cd $(brew --repo atomicjar/tap)`.

Casks and formulae in this tap are checked for updates, and updates are applied manually once we release the new versions.

### Updating with the `brew` CLI

To check for new updates for any of the casks or formulae, run the following command:

`brew livecheck --tap atomicjar/tap`

If an update is available, you can open a pull request using the `brew bump/bump-cask-pr` command.

- Prepare authorization: `gh auth login`
- Bump the version: `brew bump --cask --open-pr testcontainers-desktop`

### Updating manually

To update the version manually you can directly edit `version` and `sha256` in the [cask file](Casks/testcontainers-desktop.rb). Run the following command with the correct `<version>` to compute the sha256:
```
wget -O - https://app.testcontainers.cloud/download/testcontainers-desktop_<version>_darwin_universal.dmg | shasum -a 256
```

## Known issues
- https://github.com/orgs/Homebrew/discussions/4497


[homebrew_tap_badge]: https://img.shields.io/badge/brew%20tap-atomicjar/tap-orange?style=flat-square&logo=Homebrew&color=FBB040
[homebrew_tap_url]: https://github.com/atomicjar/homebrew-tap
[tcd_landing]: https://testcontainers.com/desktop/
[web_downloads]: https://app.testcontainers.cloud/dashboard/install

