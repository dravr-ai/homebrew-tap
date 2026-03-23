# typed: false
# frozen_string_literal: true

class Embacle < Formula
  desc "LLM runner that wraps AI CLI tools as a unified OpenAI-compatible API + MCP server"
  homepage "https://github.com/dravr-ai/dravr-embacle"
  version "0.14.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-embacle/releases/download/v#{version}/embacle-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "e9f252c8dce9a4d429dba3deacf44102a8f91fb9ab9b80522fb3abf62a94047f"
    else
      url "https://github.com/dravr-ai/dravr-embacle/releases/download/v#{version}/embacle-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4f55d26139334cc4a61fa491f67e4845cf5a79258380ac8cdbbef93aa6051143"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-embacle/releases/download/v#{version}/embacle-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8c8aa03c9d56b2d4527f7822f7f6ca72da63bc971084d6a6bd26014e53d41e33"
  end

  def install
    bin.install "embacle-server"
    bin.install "embacle-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/embacle-server --version")
    assert_match version.to_s, shell_output("#{bin}/embacle-mcp --version")
  end
end
