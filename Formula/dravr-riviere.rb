# typed: false
# frozen_string_literal: true

class DravrRiviere < Formula
  desc "Time-series storage engine for health and fitness metric persistence"
  homepage "https://github.com/dravr-ai/dravr-riviere"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-riviere/releases/download/v#{version}/dravr-riviere-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "8331ca229dffc746440c97aa705ec11be5304dde216d19118140afc52f3f7824"
    else
      url "https://github.com/dravr-ai/dravr-riviere/releases/download/v#{version}/dravr-riviere-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "bad50db1487684cdf603f392cd04148f0e471dfa403c2231dbe9fb4d65510588"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-riviere/releases/download/v#{version}/dravr-riviere-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "25e727d579a4ce1a7fd041c345f1d226ef171eb8eccb80bfe2eb34de58018e5f"
  end

  def install
    bin.install "dravr-riviere-server"
    bin.install "dravr-riviere-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dravr-riviere-server --version")
    assert_match version.to_s, shell_output("#{bin}/dravr-riviere-mcp --version")
  end
end
