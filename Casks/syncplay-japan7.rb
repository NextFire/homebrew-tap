cask "syncplay-japan7" do
  version "6ec05007"
  sha256 "6ec05007b3331fa83615ff5a7a2d5dc1136e5f3c9cd4a9732121520f297da62b"

  url "https://hikari.butaishoujo.moe/b/#{version}/Syncplay_1.7.1.dmg.zip",
      verified: "hikari.butaishoujo.moe/"
  name "Syncplay-Japan7"
  desc "Synchronises media players"
  homepage "https://github.com/odrling/syncplay"

  conflicts_with cask: "syncplay"
  depends_on macos: ">= :sierra"

  app "Syncplay.app"

  zap trash: [
    "~/.syncplay",
    "~/Library/Preferences/com.syncplay.Interface.plist",
    "~/Library/Preferences/com.syncplay.MainWindow.plist",
    "~/Library/Preferences/com.syncplay.MoreSettings.plist",
    "~/Library/Preferences/com.syncplay.PlayerList.plist",
    "~/Library/Preferences/pl.syncplay.Syncplay.plist",
    "~/Library/Saved Application State/pl.syncplay.Syncplay.savedState",
  ]
end
