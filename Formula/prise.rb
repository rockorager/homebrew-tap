class Prise < Formula
  desc "Terminal multiplexer targeted at modern terminals"
  homepage "https://github.com/rockorager/prise"
  url "https://github.com/rockorager/prise/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5845a8fa440a6b827d9b20507da2c4bb3e382bce5dcbaf11307fc148599d8135"
  license "MIT"
  head "https://github.com/rockorager/prise.git", branch: "main"

  depends_on "zig" => :build
  depends_on xcode: :build

  def install
    system "zig", "build", "-Doptimize=ReleaseSafe", "--prefix", prefix
  end

  service do
    run [opt_bin/"prise", "serve"]
    keep_alive true
  end

  test do
    assert_match "prise", shell_output("#{bin}/prise --help")
  end
end