# typed: false
# frozen_string_literal: true

class DravrSciotte < Formula
  desc "Strava training data scraper with headless Chrome, OAuth, and in-memory caching"
  homepage "https://github.com/dravr-ai/dravr-sciotte"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-sciotte/releases/download/v#{version}/dravr-sciotte-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "ee89a89d9e8db996f34ba986156e33ccbe08269bf04da0b99a5a1d99f36f6d52"
    else
      url "https://github.com/dravr-ai/dravr-sciotte/releases/download/v#{version}/dravr-sciotte-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "6648b652374b5fb18f9e1dfd49a1c66f04957a16e12799209a2e1be0fdecb831"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-sciotte/releases/download/v#{version}/dravr-sciotte-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "192631a3c6da2599fde3a62f51cb1ae8ad6151be4fc1d053e8d2cb4284d63361"
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
