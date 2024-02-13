cask "aegisub-japan7" do
  version "c06b0c34"
  sha256 "c06b0c3407dff21f12f01403ad7dac7375ba858394b5a8c693dad24dd99e7dae"

  url "https://hikari.butaishoujo.moe/b/#{version}/Aegisub-3.2.2.dmg.zip",
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
