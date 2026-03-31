# typed: false
# frozen_string_literal: true

class DravrRiviere < Formula
  desc "Health data sync orchestrator — webhook-driven provider sync with cursor-based CDC"
  homepage "https://github.com/dravr-ai/dravr-enforme"
  version "0.0.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-enforme/releases/download/v#{version}/dravr-enforme-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "bb4fdad862cc98d6e7043c98f975ac05b0461f1b3cf3e26d2328106d92da66a4"
    else
      url "https://github.com/dravr-ai/dravr-enforme/releases/download/v#{version}/dravr-enforme-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b0bae720c3607e046ca0c6485479a2dec10e50119eba9a099ae5c8d73ded494d"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-enforme/releases/download/v#{version}/dravr-enforme-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8f149e2cd52309eee939de903c721a3df6225e7b54713eb3f8ce12e19a61cb4f"
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
