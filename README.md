# Homebrew tap for Qur

```sh
brew tap peur-technologies/qur
brew trust peur-technologies/qur
brew install --cask qur
```

Upgrade with `brew upgrade --cask qur`.

Qur isn't notarized yet, so the cask removes macOS's quarantine flag after installing. If you installed it another way (the zip from Releases) and macOS blocks it, trust it yourself:

```sh
xattr -dr com.apple.quarantine /Applications/Qur.app
```
