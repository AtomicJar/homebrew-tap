# Atomicjar Homebrew Tap

[![hombrew tap atomicjar][homebrew_tap_badge]][homebrew_tap_url]

More download options you can find on Testcontainers Cloud's web application [downloads](https://app.testcontainers.cloud/dashboard/install).

## Casks

### `testcontainers-cloud-desktop`  <img src="https://img.shields.io/badge/testcontainers--cloud--desktop-latest-orange?style=flat-square&color=FBB040" align="right"/>

Testcontainers Cloud Desktop application

```
brew install atomicjar/tap/testcontainers-cloud-desktop
```
#### OR

```
brew tap atomicjar/tap
brew install testcontainers-cloud-desktop
```


## Updating the version of the cask

This tap is a regular git repository and could be navigated using `cd $(brew --repo atomicjar/tap)`.

Casks and formulae in this tap are checked for updates, and updates are applied manually once we release the new versions.

To check for new updates for any of the casks or formulae, run the following command:

`brew livecheck --tap atomicjar/tap`

If an update is available, you can open a pull request using the `brew bump/bump-cask-pr` command.

- Prepare authorization: `gh auth login`
- Bump the version: `brew bump --cask --open-pr testcontainers-cloud-desktop`

[homebrew_tap_badge]: https://img.shields.io/badge/brew%20tap-atomicjar/tap-orange?style=flat-square&logo=Homebrew&color=FBB040
[homebrew_tap_url]: https://github.com/atomicjar/homebrew-tap

## Known issues
- https://github.com/orgs/Homebrew/discussions/4497
