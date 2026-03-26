# typed: false
# frozen_string_literal: true

class DravrEquilibre < Formula
  desc "Health and wellness domain models with composition-based provider traits"
  homepage "https://github.com/dravr-ai/dravr-equilibre"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-equilibre/releases/download/v#{version}/dravr-equilibre-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "288fabf2d66b09ba07472c8f8117b707f468352f0d3e5ee001cd71f1d367a877"
    else
      url "https://github.com/dravr-ai/dravr-equilibre/releases/download/v#{version}/dravr-equilibre-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4d85448afbe5d79c58171b02d5fba2c96dbea784c448a24d53cfa6f1067d8ea1"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-equilibre/releases/download/v#{version}/dravr-equilibre-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "42cdb0afffd018b00486a6c182d22556ba6c7bcf14d21b0b3925882151bbc212"
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
