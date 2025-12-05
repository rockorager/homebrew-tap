class Zigdoc < Formula
  desc "Command-line tool to view documentation for Zig standard library symbols"
  homepage "https://github.com/rockorager/zigdoc"
  url "https://github.com/rockorager/zigdoc/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ad2803fbef79c7a812540674209b4c8b679c3e48c3af7fdfc143923e3e1b2083"
  license "MIT"
  head "https://github.com/rockorager/zigdoc.git", branch: "main"

  depends_on "zig" => :build

  def install
    system "zig", "build", "-Doptimize=ReleaseSafe", "--prefix", prefix
  end

  test do
    assert_match "zigdoc", shell_output("#{bin}/zigdoc --help")
  end
end
