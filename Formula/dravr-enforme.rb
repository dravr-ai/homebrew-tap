# typed: false
# frozen_string_literal: true

class DravrRiviere < Formula
  desc "Health data sync orchestrator — webhook-driven provider sync with cursor-based CDC"
  homepage "https://github.com/dravr-ai/dravr-enforme"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-enforme/releases/download/v#{version}/dravr-enforme-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "05d3990e36e6d2ff59e999997578240ba4063a93dad6b86afce45a452c1443ff"
    else
      url "https://github.com/dravr-ai/dravr-enforme/releases/download/v#{version}/dravr-enforme-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "223a9b32da7f5ee014debf06b0c076a4b09086f49cecf1e15b09bf5dd3a57627"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-enforme/releases/download/v#{version}/dravr-enforme-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "15a92e838d864d6fe6105a8e9d9881a90a604c520d1231c61b3290dded4f1188"
  end

  def install
    bin.install "dravr-enforme-server"
    bin.install "dravr-enforme-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dravr-enforme-server --version")
    assert_match version.to_s, shell_output("#{bin}/dravr-enforme-mcp --version")
  end
end
