# typed: false
# frozen_string_literal: true

class DravrCanot < Formula
  desc "Unified multi-platform messaging server for WhatsApp, Slack, Discord, Telegram, and Messenger"
  homepage "https://github.com/dravr-ai/dravr-canot"
  version "0.1.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-canot/releases/download/v#{version}/dravr-canot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "4576a03cb7f796dac5bd934403b2ce9470db6b988fa9d891f19be45b7bcef453"
    else
      url "https://github.com/dravr-ai/dravr-canot/releases/download/v#{version}/dravr-canot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b518ce2c6bb5cfdc3a38047219d3dfe41a70d4c4ddbeaaaf3f80d0cbd242c4fd"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-canot/releases/download/v#{version}/dravr-canot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a171f0bb28c54f45b7c0f6d2082db82cc5579253cc5da3ce8250d0c18221126f"
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
