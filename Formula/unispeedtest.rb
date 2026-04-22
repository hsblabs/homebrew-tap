class Unispeedtest < Formula
  desc "Extensible speed test CLI for measuring download/upload, latency, jitter, and packet loss."
  homepage "https://github.com/hsblabs/universal-speedtest-cli"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hsblabs/universal-speedtest-cli/releases/download/v0.1.0/unispeedtest_0.1.0_darwin_arm64.tar.gz"
      sha256 "90d352dc585bc0d7cc3084cb500aa69ba3fe5478eaabb790554fe83f4146ba13"
    else
      url "https://github.com/hsblabs/universal-speedtest-cli/releases/download/v0.1.0/unispeedtest_0.1.0_darwin_amd64.tar.gz"
      sha256 "47b45ab25db31bdc9f7ec1b09b2f04b3179ee0dd4b8c40c79bd8ecdcc7539f97"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hsblabs/universal-speedtest-cli/releases/download/v0.1.0/unispeedtest_0.1.0_linux_arm64.tar.gz"
      sha256 "40cc34c25c180c5f6345bc47cd7bf6d2b916dbfcdc8a59a0a0e9f72ae721c60d"
    else
      url "https://github.com/hsblabs/universal-speedtest-cli/releases/download/v0.1.0/unispeedtest_0.1.0_linux_amd64.tar.gz"
      sha256 "57915b658b9350f533616bb1b60e7497fd0cae950d1172d4a411f876208efb9c"
    end
  end

  def install
    bin.install "unispeedtest"
  end

  test do
    assert_match "Output results in JSON format", shell_output("#{bin}/unispeedtest -h 2>&1", 0)
  end
end
