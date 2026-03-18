# typed: false
# frozen_string_literal: true

class DravrCanot < Formula
  desc "Unified multi-platform messaging server for WhatsApp, Slack, Discord, Telegram, and Messenger"
  homepage "https://github.com/dravr-ai/dravr-canot"
  version "0.1.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-canot/releases/download/v#{version}/dravr-canot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "1ced44ff51b5461052bb3a4c7666611d4ff4449db424f5720c943ca857bfa108"
    else
      url "https://github.com/dravr-ai/dravr-canot/releases/download/v#{version}/dravr-canot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "990767ea4ffb07e5aaf239160380e7d23fa606017605fd8cc1b1154eec82e845"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-canot/releases/download/v#{version}/dravr-canot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "059c2fa503b1ec5e28d46a441dc950df5ffe622e33a0f7195f9b412832e37468"
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
