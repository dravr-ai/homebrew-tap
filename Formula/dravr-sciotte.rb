# typed: false
# frozen_string_literal: true

class DravrSciotte < Formula
  desc "Strava training data scraper with headless Chrome, OAuth, and in-memory caching"
  homepage "https://github.com/dravr-ai/dravr-sciotte"
  version "0.4.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-sciotte/releases/download/v#{version}/dravr-sciotte-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "36a13fa94016bddb2ae00aa0e32732eb6a0a45fcc26a8937a7e1c1045ac9cab7"
    else
      url "https://github.com/dravr-ai/dravr-sciotte/releases/download/v#{version}/dravr-sciotte-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "fcf0d543ef8a2fc68d97d04f8884ae5d673599898e99744b0a3a206fbf8a9979"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-sciotte/releases/download/v#{version}/dravr-sciotte-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "46831ad11ad40feb38c394d23bab2ad1ec6123f91cabf260bd2a10ee33ecb2cd"
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
