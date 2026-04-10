# typed: false
# frozen_string_literal: true

class DravrRiviere < Formula
  desc "Health data sync orchestrator — webhook-driven provider sync with cursor-based CDC"
  homepage "https://github.com/dravr-ai/dravr-enforme"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-enforme/releases/download/v#{version}/dravr-enforme-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "a82b5c863ad837765929c875e97087bda68a0553a1d1634f18f280ac5ef2d949"
    else
      url "https://github.com/dravr-ai/dravr-enforme/releases/download/v#{version}/dravr-enforme-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c060cf5e2b9a50120c9f13f5547abe9dc79fbc4ead7521835acbdb9cfd4de670"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-enforme/releases/download/v#{version}/dravr-enforme-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "41090e3f3de736cb2d7c063123106234edb561d21f534ebcb70f2c3dda1855ac"
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
