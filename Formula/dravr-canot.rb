# typed: false
# frozen_string_literal: true

class DravrCanot < Formula
  desc "Unified multi-platform messaging server for WhatsApp, Slack, Discord, Telegram, and Messenger"
  homepage "https://github.com/dravr-ai/dravr-canot"
  version "0.4.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-canot/releases/download/v#{version}/dravr-canot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "8162d7954ef969fded796b11aab523fc993321b7efa17640009ae76393b15410"
    else
      url "https://github.com/dravr-ai/dravr-canot/releases/download/v#{version}/dravr-canot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4cf085077d46a93d7ffb25d8be3eb0e3b6648ea4b4043cb9c5a90236a6c93795"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-canot/releases/download/v#{version}/dravr-canot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0f1636d53ad15a7fb815c9bbfb921d7ed1701ff582ec4278179a6cc9e854c5fc"
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
