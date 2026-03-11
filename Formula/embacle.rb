# typed: false
# frozen_string_literal: true

class Embacle < Formula
  desc "LLM runner that wraps AI CLI tools as a unified OpenAI-compatible API + MCP server"
  homepage "https://github.com/dravr-ai/dravr-embacle"
  version "0.10.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-embacle/releases/download/v#{version}/embacle-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "e7534b3a4dc113e1ae8fc52dc4378a969cc9152cf9beedf5cc3b7617a966205a"
    else
      url "https://github.com/dravr-ai/dravr-embacle/releases/download/v#{version}/embacle-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b1a11805047f57ccb5607cf6eef396c79f6a9d75c6fe106e687ba661e5e30269"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-embacle/releases/download/v#{version}/embacle-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "43c82caccc1f7038e99024a12d0c090d03ccf0107cf3af9e5cfcad19b8ae680f"
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
