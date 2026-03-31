# typed: false
# frozen_string_literal: true

class DravrRiviere < Formula
  desc "Time-series storage engine for health and fitness metric persistence"
  homepage "https://github.com/dravr-ai/dravr-riviere"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-riviere/releases/download/v#{version}/dravr-riviere-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "a6157879dabe99feeaa168efdd853be72f1ed077c51a70dd4d137b1a06ded730"
    else
      url "https://github.com/dravr-ai/dravr-riviere/releases/download/v#{version}/dravr-riviere-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "af469000c6e8d536f802c871cc2aaed03601aeba0cbacee6fd087a6637f8de17"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-riviere/releases/download/v#{version}/dravr-riviere-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e39d623f0438416d9fcc5df64b31c10c3f9208118bcd7488a123fc89ae003b6e"
  end

  def install
    bin.install "dravr-riviere-server"
    bin.install "dravr-riviere-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dravr-riviere-server --version")
    assert_match version.to_s, shell_output("#{bin}/dravr-riviere-mcp --version")
  end
end
