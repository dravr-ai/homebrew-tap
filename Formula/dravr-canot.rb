# typed: false
# frozen_string_literal: true

class DravrCanot < Formula
  desc "Unified multi-platform messaging server for WhatsApp, Slack, Discord, Telegram, and Messenger"
  homepage "https://github.com/dravr-ai/dravr-canot"
  version "0.3.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-canot/releases/download/v#{version}/dravr-canot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "45a4498774078de329dc47a3ac33a57a9aa19753cda2a9de8108899a4d4c01dc"
    else
      url "https://github.com/dravr-ai/dravr-canot/releases/download/v#{version}/dravr-canot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2bceb35d0d389f32584a59550b8463f2a927c6569c67101d72d39ec6468d705f"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-canot/releases/download/v#{version}/dravr-canot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "970d043a579427a7d6fea9cb4d4ca9e6e8a63d8772e5cc8a11b6db0e28e41dce"
  end

  def install
    bin.install "dravr-canot-server"
    bin.install "dravr-canot-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dravr-canot-server --version")
    assert_match version.to_s, shell_output("#{bin}/dravr-canot-mcp --version")
  end
end
