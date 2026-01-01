class Zigdoc < Formula
  desc "Command-line tool to view documentation for Zig standard library symbols"
  homepage "https://github.com/rockorager/zigdoc"
  url "https://github.com/rockorager/zigdoc/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "8f989d1ffe6b20642712e4ec9ccc46efeb3fff9f51d0257e2f62de51ebb2c753"
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
