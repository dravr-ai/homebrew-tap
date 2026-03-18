# typed: false
# frozen_string_literal: true

class DravrCanot < Formula
  desc "Unified multi-platform messaging server for WhatsApp, Slack, Discord, Telegram, and Messenger"
  homepage "https://github.com/dravr-ai/dravr-canot"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-canot/releases/download/v#{version}/dravr-canot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "f57d12b2dd02f059b168168d6eb29169ae29ed72b26bc56cbcdc94998f8b5d05"
    else
      url "https://github.com/dravr-ai/dravr-canot/releases/download/v#{version}/dravr-canot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2d03055b949c65fdc0315b6d457e48a45440e81ead337aed2b72f026c006583e"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-canot/releases/download/v#{version}/dravr-canot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3eccd661f96a7e7c5c48ed27076679dbc1e5bfa02c70fb23d120a2604be2a8f0"
  end

  def install
    bin.install "dravr-canot-server"
    bin.install "dravr-canot-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dravr-canot-server --version")
    assert_match version.to_s, shell_output("#{bin}/dravr-canot-mcp --version")
  end
end
