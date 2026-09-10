# homebrew-psysonic

Deprecated tap for [Psysonic](https://github.com/Psysonic/psysonic) — a desktop client for
Navidrome and other Subsonic-compatible servers.

**Psysonic is now in the official Homebrew cask repository.** Install it directly, with no tap
and no `brew trust` step:

```bash
brew install --cask psysonic
```

## Already installed from this tap?

Nothing to do by hand. `tap_migrations.json` in this repository points the old token at
`homebrew/cask`, so Homebrew moves the installation over on the next `brew update`. Once it has,
the tap can be removed:

```bash
brew untap psysonic/psysonic
```

Settings, server profiles and the local library index are untouched by any of this — they live in
`~/Library/Application Support/dev.psysonic.player`, not inside the app bundle.

## Why this tap existed

It carried the cask between 2026-08-16 and the upstream merge, kept it bumped on every stable
release, and served as the pre-submission test bed. The cask definition, its audit workflow and
the auto-bump workflow have been removed; the history remains in this repository.

## License

The cask definition in this repository was available under the [MIT License](LICENSE).

Psysonic itself is licensed under the GNU General Public License v3.0 — see the
[main repository](https://github.com/Psysonic/psysonic).
