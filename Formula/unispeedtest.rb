class Unispeedtest < Formula
  desc "Extensible speed test CLI for measuring download/upload, latency, jitter, and packet loss."
  homepage "https://github.com/hsblabs/universal-speedtest-cli"
  license "MIT"
  version "0.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hsblabs/universal-speedtest-cli/releases/download/v0.2.1/unispeedtest_0.2.1_darwin_arm64.tar.gz"
      sha256 "887c519719a8a2f703b8182aa8a946c4039576965afc7b08d921ef8d79ef1754"
    else
      url "https://github.com/hsblabs/universal-speedtest-cli/releases/download/v0.2.1/unispeedtest_0.2.1_darwin_amd64.tar.gz"
      sha256 "eaeb7239d0650514dbf7e702a0432530ab608e3b190a236224e7356825ff416d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hsblabs/universal-speedtest-cli/releases/download/v0.2.1/unispeedtest_0.2.1_linux_arm64.tar.gz"
      sha256 "a4c7e6b9d94ae39418fb88520b7a800abee0a523a35799bfd4495f0594afab44"
    else
      url "https://github.com/hsblabs/universal-speedtest-cli/releases/download/v0.2.1/unispeedtest_0.2.1_linux_amd64.tar.gz"
      sha256 "5b171181a7bde93dc88d6a7fdb1984a308b79788cf43da8c7d39e8a91c8583a8"
    end
  end

  def install
    bin.install "unispeedtest"
  end

  test do
    assert_match "Output results in JSON format", shell_output("#{bin}/unispeedtest -h 2>&1", 0)
  end
end
