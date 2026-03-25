# typed: false
# frozen_string_literal: true

class DravrSciotte < Formula
  desc "Strava training data scraper with headless Chrome, OAuth, and in-memory caching"
  homepage "https://github.com/dravr-ai/dravr-sciotte"
  version "0.4.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-sciotte/releases/download/v#{version}/dravr-sciotte-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "e5a7c106e7c712c82be3c35f167b4ebb4be9a542eda2bd7d5c51f7e48bed6361"
    else
      url "https://github.com/dravr-ai/dravr-sciotte/releases/download/v#{version}/dravr-sciotte-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "a003d90cc4ff82a3ce3c6026d472f1cf62fdd2540d91175b87e79b0307703761"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-sciotte/releases/download/v#{version}/dravr-sciotte-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "afcc73a4b20bc5f0b3e36986278297a8d51acb04a972254ad714fbdc53d62109"
  end

  def install
    bin.install "dravr-sciotte-server"
    bin.install "dravr-sciotte-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dravr-sciotte-server --version")
    assert_match version.to_s, shell_output("#{bin}/dravr-sciotte-mcp --version")
  end
end
