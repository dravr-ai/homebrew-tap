# typed: false
# frozen_string_literal: true

class DravrSciotte < Formula
  desc "Strava training data scraper with headless Chrome, OAuth, and in-memory caching"
  homepage "https://github.com/dravr-ai/dravr-sciotte"
  version "0.2.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-sciotte/releases/download/v#{version}/dravr-sciotte-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "7ff974d8b88fa15b267f717e311ad5d052288ec1be4ca6c5b13f5782c4d3d374"
    else
      url "https://github.com/dravr-ai/dravr-sciotte/releases/download/v#{version}/dravr-sciotte-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d5e571f52413c1371aa9dc740a0423ad3ac31c4cac0e8f7037824bdd8b1b3863"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-sciotte/releases/download/v#{version}/dravr-sciotte-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "51bf071c3ce530cc42c05c5ae7e9f4a9be34ce925df8f52c01744b3c0d4297e0"
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
