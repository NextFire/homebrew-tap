cask "mpv-git" do
  version "0.33.0-388-g254730d891"
  sha256 "918aea4e70042bf3a7af44c0acee050b7000ee0b694163d8d93d2ec44da62e76"

  url "https://github.com/NextFire/mpv-macos-git-builds/releases/download/mpv-#{version}/mpv-#{version}.zip",
      verified: "github.com/NextFire/mpv-macos-git-builds/"
  name "mpv"
  desc "Media player based on MPlayer and mplayer2"
  homepage "https://mpv.io/"

  conflicts_with formula: "mpv", cask: "mpv"
  depends_on macos: ">= :sierra"

  app "mpv.app"
  binary "#{appdir}/mpv.app/Contents/MacOS/mpv"

  zap trash: [
    "~/.config/mpv",
    "~/Library/Logs/mpv.log",
    "~/Library/Preferences/io.mpv.plist",
    "~/Library/Preferences/mpv.plist",
  ]
end
