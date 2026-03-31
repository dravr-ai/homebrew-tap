# typed: false
# frozen_string_literal: true

class DravrEquilibre < Formula
  desc "Health and wellness domain models with composition-based provider traits"
  homepage "https://github.com/dravr-ai/dravr-equilibre"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-equilibre/releases/download/v#{version}/dravr-equilibre-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0544f83cd4ed849f96fa8eed60ee8b28d8f2d5b0a54ce60e97946665576d9e1b"
    else
      url "https://github.com/dravr-ai/dravr-equilibre/releases/download/v#{version}/dravr-equilibre-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "f88e37dd90ca31710006f90d2cb24de90f53b8f3bea6c9ba8f268ca070d87cc3"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-equilibre/releases/download/v#{version}/dravr-equilibre-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "70a962e317c8d104da1eefe6b7dad058f8186b797c16bcfe3b25ab4051b8cd39"
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
