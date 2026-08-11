class Unispeedtest < Formula
  desc "Extensible speed test CLI for measuring download/upload, latency, jitter, and packet loss."
  homepage "https://github.com/hsblabs/universal-speedtest-cli"
  license "MIT"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hsblabs/universal-speedtest-cli/releases/download/v0.3.0/unispeedtest_0.3.0_darwin_arm64.tar.gz"
      sha256 "430bfa6671869fda4bc35047d9409368da734e09fcbaa78490bde54072865505"
    else
      url "https://github.com/hsblabs/universal-speedtest-cli/releases/download/v0.3.0/unispeedtest_0.3.0_darwin_amd64.tar.gz"
      sha256 "8cf0ad489e37ab72dd41321ab741d54ef74731555368f77d4decd8ddbd02c27b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hsblabs/universal-speedtest-cli/releases/download/v0.3.0/unispeedtest_0.3.0_linux_arm64.tar.gz"
      sha256 "90d17de0f4b1c8adc57e490f732c56632add2a477f76a73b1bbecac8a89c5597"
    else
      url "https://github.com/hsblabs/universal-speedtest-cli/releases/download/v0.3.0/unispeedtest_0.3.0_linux_amd64.tar.gz"
      sha256 "f6f18988f33f37d8a261100a9b10e1eb1582b435a72e526e076f6fec6244fa01"
    end
  end

  def install
    bin.install "unispeedtest"
  end

  test do
    assert_match "Output results in JSON format", shell_output("#{bin}/unispeedtest -h 2>&1", 0)
  end
end
