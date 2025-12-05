class Prise < Formula
  desc "Terminal multiplexer targeted at modern terminals"
  homepage "https://github.com/rockorager/prise"
  url "https://github.com/rockorager/prise/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"
  head "https://github.com/rockorager/prise.git", branch: "main"

  depends_on "zig" => :build

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