class Zigdoc < Formula
  desc "Command-line tool to view documentation for Zig standard library symbols"
  homepage "https://github.com/rockorager/zigdoc"
  url "https://github.com/rockorager/zigdoc/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "84bb397dff39949af6d48be814d0cee0b824a2c364f03f24c8f4f89062632369"
  license "MIT"
  head "https://github.com/rockorager/zigdoc.git", branch: "main"

  depends_on "zig" => :build

  def install
    system "zig", "build", "-Doptimize=ReleaseFast", "--prefix", prefix
  end

  test do
    assert_match "zigdoc", shell_output("#{bin}/zigdoc --help")
  end
end
