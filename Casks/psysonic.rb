cask "psysonic" do
  arch arm: "aarch64", intel: "x64"

  version "1.50.0"
  sha256 arm:   "5e39290ebd39eac937582e99d319e31b19584b75474a2833707414bf792be085",
         intel: "7576162d0e4508c6b8363d344004358fd54911c1a11d453b57b8f1af5ff308ff"

  url "https://github.com/Psychotoxical/psysonic/releases/download/app-v#{version}/Psysonic_#{version}_#{arch}.dmg",
      verified: "github.com/Psychotoxical/psysonic/"
  name "Psysonic"
  desc "Desktop client for Navidrome and other Subsonic-compatible servers"
  homepage "https://www.psysonic.de/"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^app[._-]v?(\d+(?:\.\d+)+)$/i)
  end

  # The app ships an in-app updater (Tauri updater plugin, macOS since 1.40.0):
  # it replaces Psysonic.app in place and relaunches. Without this stanza
  # `brew upgrade` would roll a self-updated app back to the cask version.
  auto_updates true

  # Bare symbol = minimum version (the ">= :catalina" string form is deprecated).
  depends_on macos: :catalina

  app "Psysonic.app"

  zap trash: [
    "~/Library/Application Support/dev.psysonic.player",
    "~/Library/Caches/dev.psysonic.player",
    "~/Library/Preferences/dev.psysonic.player.plist",
    "~/Library/Saved Application State/dev.psysonic.player.savedState",
    "~/Library/WebKit/dev.psysonic.player",
  ]
end
