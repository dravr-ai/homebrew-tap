# typed: false
# frozen_string_literal: true

class Embacle < Formula
  desc "LLM runner that wraps AI CLI tools as a unified OpenAI-compatible API + MCP server"
  homepage "https://github.com/dravr-ai/dravr-embacle"
  version "0.19.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-embacle/releases/download/v#{version}/embacle-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "f7673208cd0043bc00aa51e56264d574441ae68d4b8c6c37c1e2b82b3f3c5e22"
    else
      url "https://github.com/dravr-ai/dravr-embacle/releases/download/v#{version}/embacle-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "8f656356521f790259ec827301eb826aa5b7db3727d6f4771f43c24dd9a4b7b2"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-embacle/releases/download/v#{version}/embacle-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "71181ba78db1f9909a375fb31135e48e6cac8cfc5d80de78b522724132f43822"
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
