# typed: false
# frozen_string_literal: true

class Embacle < Formula
  desc "LLM runner that wraps AI CLI tools as a unified OpenAI-compatible API + MCP server"
  homepage "https://github.com/dravr-ai/dravr-embacle"
  version "0.36.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-embacle/releases/download/v#{version}/embacle-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "83ccdc388769043458b6f8742ce10b4876ef1e0c77c923c32b14119e95f8b5b2"
    else
      url "https://github.com/dravr-ai/dravr-embacle/releases/download/v#{version}/embacle-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "85757f1e350e8a10356bceb872188dfc1e937b4a771819b1c6965d4e70097d9c"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-embacle/releases/download/v#{version}/embacle-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "99f6837071c579852fa4c10ff233f7f3dda77a02a905354f820760a5bd620bd9"
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
