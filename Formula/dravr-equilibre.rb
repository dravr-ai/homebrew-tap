# typed: false
# frozen_string_literal: true

class DravrEquilibre < Formula
  desc "Health and wellness domain models with composition-based provider traits"
  homepage "https://github.com/dravr-ai/dravr-equilibre"
  version "0.2.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-equilibre/releases/download/v#{version}/dravr-equilibre-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "984a716d31f9b91c9927aea976a1f116e2a1e2ce72ca4203253cd1c07769f676"
    else
      url "https://github.com/dravr-ai/dravr-equilibre/releases/download/v#{version}/dravr-equilibre-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e45f2a49b7d96095e2e05c8f89931ca5790b21682170104c134050ae4cf23d14"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-equilibre/releases/download/v#{version}/dravr-equilibre-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "116d721e6cca3d853fa0cedc1778d83f7106586ff34af0627f4d88170e0ae1dd"
  end

  def install
    bin.install "dravr-equilibre-server"
    bin.install "dravr-equilibre-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dravr-equilibre-server --version")
    assert_match version.to_s, shell_output("#{bin}/dravr-equilibre-mcp --version")
  end
end
