class Garage < Formula
  desc "S3-compatible object store for small self-hosted geo-distributed deployments"
  homepage "https://garagehq.deuxfleurs.fr"
  url "https://git.deuxfleurs.fr/Deuxfleurs/garage/archive/v1.0.0.tar.gz"
  sha256 "70fa89f732a3de4bb2d1158a2e89c521a993a734eb24b6bd65e79c207c2e8868"
  license "AGPL-3.0-or-later"
  head "https://git.deuxfleurs.fr/Deuxfleurs/garage.git", branch: "main"

  bottle do
    root_url "https://github.com/NextFire/homebrew-tap/releases/download/garage-1.0.0"
    sha256 cellar: :any,                 arm64_sonoma: "839a448bb378c3a1274d9f6fa19499376ac6711e58093fb754cde1e9d96e7117"
    sha256 cellar: :any,                 ventura:      "6856c87b0463894c72e6a0be2fceca129d749ec31c134b124d9d9bc6c63928b7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "27036921b438d685bd61c423ccdc43cc96204eb230be8301b5e627b019fd975f"
  end

  depends_on "rust" => :build
  depends_on "libsodium"
  depends_on "lmdb"
  depends_on "sqlite"
  depends_on "zstd"

  def install
    system "cargo", "install", "--no-default-features",
           "--features", "system-libs,metrics,lmdb,sqlite",
           *std_cargo_args(path: "src/garage")
  end

  test do
    system "#{bin}/garage", "--version"
  end
end
