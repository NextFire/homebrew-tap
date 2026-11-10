class AppleMusicDiscordRpc < Formula
  desc "Discord Rich Presence Client for the macOS Apple Music app and iTunes"
  homepage "https://github.com/NextFire/apple-music-discord-rpc"
  url "https://github.com/NextFire/apple-music-discord-rpc/archive/refs/tags/0.18.1.tar.gz"
  sha256 "55eb0ace50404d422c0d034b4c44e6664b151a7da734c9da8354c526f751a339"
  license "MIT"
  head "https://github.com/NextFire/apple-music-discord-rpc.git", branch: "main"

  depends_on "deno"

  def install
    libexec.install "music-rpc.ts", "discord.ts", "jxa.ts"
    (bin/"music-rpc").write <<~SH
      #!/bin/sh
      exec "#{Formula["deno"].opt_bin}/deno" run \\
        --allow-env --allow-run --allow-net --allow-read --allow-write --unstable-kv \\
        "#{libexec}/music-rpc.ts" "$@"
    SH
  end

  service do
    run opt_bin/"music-rpc"
    keep_alive true
    environment_variables PATH: std_service_path_env
    working_dir var/"apple-music-discord-rpc"
    error_log_path var/"apple-music-discord-rpc/music-rpc.log"
  end
end
