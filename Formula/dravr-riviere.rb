# typed: false
# frozen_string_literal: true

class DravrRiviere < Formula
  desc "Time-series storage engine for health and fitness metric persistence"
  homepage "https://github.com/dravr-ai/dravr-riviere"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-riviere/releases/download/v#{version}/dravr-riviere-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "296c90e0f8d4807ed05e23959486816a0e64e25f298457310a188e2c70861f6b"
    else
      url "https://github.com/dravr-ai/dravr-riviere/releases/download/v#{version}/dravr-riviere-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "7e201a49cfce38ada0b9ee1a5f5b4a3c7fc779854a60a652826ed31419d8e648"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-riviere/releases/download/v#{version}/dravr-riviere-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "74d102d861a96cc243f29fea56c20769ff5620ae67bcc9cb84974cf967223c25"
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
