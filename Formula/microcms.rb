class Microcms < Formula
  desc "CLI for working with the microCMS Content and Management APIs"
  homepage "https://github.com/hsblabs/microcms-cli"
  license "MIT"
  version "0.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hsblabs/microcms-cli/releases/download/v0.0.1/microcms_0.0.1_darwin_arm64.tar.gz"
      sha256 "bce61091cf31bf533a17cae808dfcd247e9b2fabddfb8d2c8a342ab6209a4e6a"
    else
      url "https://github.com/hsblabs/microcms-cli/releases/download/v0.0.1/microcms_0.0.1_darwin_amd64.tar.gz"
      sha256 "81b055cba3effd88ed624f51fec2c1b5a1ef7eae0a27e71bc9e324e030840ed4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hsblabs/microcms-cli/releases/download/v0.0.1/microcms_0.0.1_linux_arm64.tar.gz"
      sha256 "9157842c51d3eaf560dcb54b6e7f2a00b45cf3c8da3ad77f46dfa009f5b0acc9"
    else
      url "https://github.com/hsblabs/microcms-cli/releases/download/v0.0.1/microcms_0.0.1_linux_amd64.tar.gz"
      sha256 "21369a04e417a33412b57fec6b4bcfabb5b7fd095cd8ed3964ef4ca6c3d6e143"
    end
  end

  def install
    bin.install "microcms"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/microcms --version", 0)
  end
end
