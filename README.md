# homebrew-psysonic

Homebrew tap for [Psysonic](https://github.com/Psychotoxical/psysonic) — a desktop client for
Navidrome and other Subsonic-compatible servers.

## Install

```bash
brew tap psysonic/psysonic
brew install --cask psysonic
```

## Updating

Psysonic updates itself on macOS through its built-in updater, so the cask is marked
`auto_updates true` and `brew upgrade` deliberately leaves it alone. To force the cask
version anyway:

```bash
brew upgrade --cask --greedy psysonic
```

## Uninstall

```bash
brew uninstall --cask psysonic          # removes the app
brew uninstall --cask --zap psysonic    # also removes settings, caches and the local library index
```

> `--zap` deletes the local library index and all app settings. Use it only for a clean slate.

## Notes

- Builds are signed and notarized with an Apple Developer ID, so no Gatekeeper workaround is needed.
- The cask tracks stable releases only. Release candidates are published as GitHub pre-releases and
  are intentionally invisible to both this tap and the in-app updater.
- Apple Silicon and Intel are both supported; Homebrew picks the matching build automatically.

## License

The cask definition in this repository is available under the [MIT License](LICENSE).

Psysonic itself is licensed under the GNU General Public License v3.0 — see the
[main repository](https://github.com/Psychotoxical/psysonic).
