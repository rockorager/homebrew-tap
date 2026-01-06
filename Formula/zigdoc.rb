class Zigdoc < Formula
  desc "Command-line tool to view documentation for Zig standard library symbols"
  homepage "https://github.com/rockorager/zigdoc"
  url "https://github.com/rockorager/zigdoc/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "cd3d47f34c0f813ef0e12fc93ec90b714652302998b05756e33df1fd187684b8"
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
