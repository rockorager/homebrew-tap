class Prise < Formula
  desc "Terminal multiplexer targeted at modern terminals"
  homepage "https://github.com/rockorager/prise"
  url "https://github.com/rockorager/prise/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "bcd2b8c1991f56ec393585398fe33f94cd1ff000f1892518f9d1ec0ea5512a7c"
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