cask "aegisub-japan7" do
  version "dc269f21"
  sha256 "dc269f21abebff07388ed6543f9be99dda198e5cf8b46e4b25f4cfd88d6d020f"

  url "https://hikari.butaishoujo.moe/b/#{version}/Aegisub-3.2.2.dmg",
      verified: "hikari.butaishoujo.moe/"
  name "Aegisub-Japan7"
  desc "Create and modify subtitles"
  homepage "https://github.com/odrling/Aegisub"

  conflicts_with cask: "aegisub"

  app "Aegisub.app"

  uninstall quit: "com.aegisub.aegisub"

  zap trash: [
    "~/Library/Application Support/Aegisub",
    "~/Library/Preferences/com.aegisub.aegisub.plist",
    "~/Library/Saved Application State/com.aegisub.aegisub.savedState",
  ]
end
