class Garage < Formula
  desc "S3-compatible object store for small self-hosted geo-distributed deployments"
  homepage "https://garagehq.deuxfleurs.fr"
  url "https://git.deuxfleurs.fr/Deuxfleurs/garage/archive/v1.0.0.tar.gz"
  sha256 "70fa89f732a3de4bb2d1158a2e89c521a993a734eb24b6bd65e79c207c2e8868"
  license "AGPL-3.0-or-later"
  head "https://git.deuxfleurs.fr/Deuxfleurs/garage.git", branch: "main"

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
