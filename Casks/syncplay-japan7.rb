cask "syncplay-japan7" do
  version "876cf322"
  sha256 "876cf322d31bfa64874890a250b8cb8783d79b6a7766965e6f2bbbdf0638f9b2"

  url "https://hikari.butaishoujo.moe/b/#{version}/Syncplay_1.7.1.dmg",
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
