cask "psysonic" do
  arch arm: "aarch64", intel: "x64"

  version "1.51.0"
  sha256 arm:   "a1963ca99f2f8358bb73088579d0cd4034c836a59aac339d60883eabda61c38c",
         intel: "72b23d4b3eee485e7d72d541d2b8b869c725e04e978f755f9db44257f93b2446"

  url "https://github.com/Psysonic/psysonic/releases/download/app-v#{version}/Psysonic_#{version}_#{arch}.dmg",
      verified: "github.com/Psysonic/psysonic/"
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
