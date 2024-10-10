class AppleMusicDiscordRpc < Formula
  desc "Discord Rich Presence Client for the macOS Apple Music app and iTunes"
  homepage "https://github.com/NextFire/apple-music-discord-rpc"
  url "https://github.com/NextFire/apple-music-discord-rpc/archive/refs/tags/0.14.0.tar.gz"
  sha256 "4735c1962ddbb898d88042ec4f91d47400184b5f632a1d9c03362573508e0ff1"
  license "MIT"
  head "https://github.com/NextFire/apple-music-discord-rpc.git", branch: "main"

  depends_on "deno"

  def install
    bin.install "music-rpc.ts"
  end

  service do
    run opt_bin/"music-rpc.ts"
    keep_alive true
    environment_variables PATH: std_service_path_env
    working_dir var/"apple-music-discord-rpc"
    error_log_path var/"apple-music-discord-rpc/music-rpc.log"
  end
end
