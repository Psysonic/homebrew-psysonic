# homebrew-psysonic

Homebrew tap for [Psysonic](https://github.com/Psysonic/psysonic) — a desktop client for
Navidrome and other Subsonic-compatible servers.

## Install

```bash
brew tap psysonic/psysonic
brew trust --cask psysonic/psysonic/psysonic
brew install --cask psysonic
```

Since Homebrew 6.0, casks from third-party taps must be trusted explicitly before Homebrew
will load them — without the `brew trust` step the install fails with
`Refusing to load cask ... from untrusted tap`. To trust every cask in this tap instead of
just this one, use `brew trust psysonic/psysonic`.

### Already installed Psysonic manually?

Homebrew refuses to overwrite an app it does not manage and stops with
`It seems there is already an App at '/Applications/Psysonic.app'`. Hand the existing
installation over to Homebrew instead:

```bash
brew install --cask --adopt psysonic
```

Use `--force` instead of `--adopt` if the installed app no longer matches the release
byte-for-byte, which happens once the in-app updater has replaced it. Neither option touches
your settings, server profiles or the local library index — those live in
`~/Library/Application Support/dev.psysonic.player`, not inside the app bundle.

### First launch takes a moment

macOS asks for confirmation the first time ("downloaded from the internet") and then verifies
the whole signed bundle before anything appears on screen. The icon can sit in the Dock for a
while with no window — that is Gatekeeper working, not a hang. Give it a few seconds; every
later start is immediate.

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
[main repository](https://github.com/Psysonic/psysonic).
