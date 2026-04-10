# typed: false
# frozen_string_literal: true

class DravrRiviere < Formula
  desc "Time-series storage engine for health and fitness metric persistence"
  homepage "https://github.com/dravr-ai/dravr-riviere"
  version "0.2.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-riviere/releases/download/v#{version}/dravr-riviere-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "aeef3dd2ac44dc7e074547aa0a78bbb3dcf509dc564ce41c138cd270216855bc"
    else
      url "https://github.com/dravr-ai/dravr-riviere/releases/download/v#{version}/dravr-riviere-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "a51bf325cc0290025828aa3919010cce7e848da514a7bd8337490109ada8c3d8"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-riviere/releases/download/v#{version}/dravr-riviere-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d0f454c6e31c3081f538c5372e8a72f4e7f8ec169b32c2e83614a95f65dd3565"
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
