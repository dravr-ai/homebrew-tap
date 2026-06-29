# typed: false
# frozen_string_literal: true

class Embacle < Formula
  desc "LLM runner that wraps AI CLI tools as a unified OpenAI-compatible API + MCP server"
  homepage "https://github.com/dravr-ai/dravr-embacle"
  version "0.19.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-embacle/releases/download/v#{version}/embacle-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "1daa5ee4a7ac520c60429e205b9493f2c63aeb1c1e47a7ff577889e523859fd9"
    else
      url "https://github.com/dravr-ai/dravr-embacle/releases/download/v#{version}/embacle-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "28c22a0db59c3a53c2c57033e944a583225bef08cdd91152d8ae1df4ffbaff30"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-embacle/releases/download/v#{version}/embacle-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "60f3f30e020eb554e38cb5bb3aa1abe38ace79396fea1b8676060db614a5559d"
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
