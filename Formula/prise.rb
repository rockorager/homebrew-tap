class Prise < Formula
  desc "Terminal multiplexer targeted at modern terminals"
  homepage "https://github.com/rockorager/prise"
  url "https://github.com/rockorager/prise/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "d664ea40e2da6545419696c0e6ec76b6aa53ccc221a76e1a6d012318a2e5341e"
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