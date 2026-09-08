class AppleMusicDiscordRpc < Formula
  desc "Discord Rich Presence Client for the macOS Apple Music app and iTunes"
  homepage "https://github.com/NextFire/apple-music-discord-rpc"
  url "https://github.com/NextFire/apple-music-discord-rpc/archive/refs/tags/0.18.0.tar.gz"
  sha256 "65e37da2c483b85ef98e32e2d9097e1154e5221bef81f708e4b9349d44cf50aa"
  license "MIT"
  head "https://github.com/NextFire/apple-music-discord-rpc.git", branch: "main"

  depends_on "deno"

  def install
    libexec.install "music-rpc.ts", "discord.ts", "jxa.ts"
    (bin/"music-rpc").write <<~SH
      #!/bin/bash
      exec "#{Formula["deno"].opt_bin}/deno" run \\
        --allow-env --allow-run --allow-net --allow-read --allow-write \\
        --unstable-kv \\
        "#{libexec}/music-rpc.ts" "$@"
    SH
  end

  service do
    run opt_bin/"music-rpc.ts"
    keep_alive true
    environment_variables PATH: std_service_path_env
    working_dir var/"apple-music-discord-rpc"
    error_log_path var/"apple-music-discord-rpc/music-rpc.log"
  end
end
