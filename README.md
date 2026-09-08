# homebrew-calmmouse

A Homebrew tap for [CalmMouse](https://github.com/Malik1942/CalmMouse) — a menu-bar
app that stops the Magic Mouse from scrolling the page every time you click.

```bash
brew tap malik1942/calmmouse
brew install --cask calmmouse
```

Or in one line:

```bash
brew install --cask malik1942/calmmouse/calmmouse
```

## Why a tap rather than homebrew-cask

Homebrew's main cask repository has a notability bar — 90 forks / 90 watchers /
225 stars for an author submitting their own app. CalmMouse isn't there yet, so
this tap is the supported way to install it with Homebrew in the meantime. If the
project clears the bar, the cask moves upstream and this tap becomes a redirect.

## Updating the cask on a new release

```bash
VERSION=1.2.3
curl -sL -o /tmp/CalmMouse.zip \
  "https://github.com/Malik1942/CalmMouse/releases/download/v$VERSION/CalmMouse.zip"
shasum -a 256 /tmp/CalmMouse.zip     # paste into sha256
```

Then bump `version` and `sha256` in `Casks/calmmouse.rb`.
