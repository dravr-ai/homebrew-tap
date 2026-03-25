# typed: false
# frozen_string_literal: true

class DravrEquilibre < Formula
  desc "Health and wellness domain models with composition-based provider traits"
  homepage "https://github.com/dravr-ai/dravr-equilibre"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dravr-ai/dravr-equilibre/releases/download/v#{version}/dravr-equilibre-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "831bf8738106bb3a415ebf3d9f790127fcfa6c606c69fee6290c30129c735bbf"
    else
      url "https://github.com/dravr-ai/dravr-equilibre/releases/download/v#{version}/dravr-equilibre-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2935199c05d91bd58647b33629796b8e7ca65f24ac9d3deeca557a2e65edd40b"
    end
  end

  on_linux do
    url "https://github.com/dravr-ai/dravr-equilibre/releases/download/v#{version}/dravr-equilibre-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "aea9f5a07360bef3c531385ab1bd7412e11ddc568cb3b7b1a7e037d32f990914"
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
