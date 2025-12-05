class Prise < Formula
  desc "Terminal multiplexer targeted at modern terminals"
  homepage "https://github.com/rockorager/prise"
  url "https://github.com/rockorager/prise/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  depends_on "zig" => :build

  def install
    system "zig", "build", "-Doptimize=ReleaseSafe", "--prefix", prefix
    bash_completion.install "completions/prise.bash" => "prise"
    zsh_completion.install "completions/prise.zsh" => "_prise"
    fish_completion.install "completions/prise.fish"
  end

  test do
    assert_match "prise", shell_output("#{bin}/prise --help")
  end
end
