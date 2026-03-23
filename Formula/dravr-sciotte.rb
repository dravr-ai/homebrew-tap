# typed: false
# frozen_string_literal: true

class DravrSciotte < Formula
  desc "Strava training data scraper with headless Chrome, OAuth, and in-memory caching"
  homepage "https://github.com/dravr-ai/dravr-sciotte"
  version "0.3.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-sciotte/releases/download/v#{version}/dravr-sciotte-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "542a7d9f641f68e426d3b366eebabeed7194bddf5b5ad0c082fb7c52d79297d3"
    else
      url "https://github.com/dravr-ai/dravr-sciotte/releases/download/v#{version}/dravr-sciotte-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "8bfd31ea1e8f23057a4025a0156caa709c39e2abc692c36040b95b0de116696e"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-sciotte/releases/download/v#{version}/dravr-sciotte-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "015f2b7dc0cdda43fd9b9473ec351f78968688bb02583c02536467bca06ebe02"
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
