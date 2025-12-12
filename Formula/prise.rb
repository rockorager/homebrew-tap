class Prise < Formula
  desc "Terminal multiplexer targeted at modern terminals"
  homepage "https://github.com/rockorager/prise"
  url "https://github.com/rockorager/prise/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "cb83faf7424a31e203a02760093bdd2d4826b1912f06bffe36e2c6fdd239bc1f"
  license "MIT"
  head "https://github.com/rockorager/prise.git", branch: "main"

  depends_on "zig" => :build
  depends_on xcode: :build

  def install
    system "zig", "build", "-Doptimize=ReleaseSafe", "-Dlua-check=false", "--prefix", prefix
  end

  service do
    run [opt_bin/"prise", "serve"]
    keep_alive true
  end

  test do
    assert_match "prise", shell_output("#{bin}/prise --help")
  end
end