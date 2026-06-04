# typed: false
# frozen_string_literal: true

class MirroirRun < Formula
  desc "Cross-platform replayer for mirroir SkillStep YAML scenarios (web/process/http)"
  homepage "https://github.com/jfarcand/mirroir-mcp"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jfarcand/mirroir-mcp/releases/download/runner-v#{version}/mirroir-run-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "065ffc4accf9724c72293fcdb7bec51dd1e90741a27e3aee4274e5460222528a"
    else
      url "https://github.com/jfarcand/mirroir-mcp/releases/download/runner-v#{version}/mirroir-run-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "cf17963f425289a0d710a8ed093f745aac435436608c16cfc15710539d306724"
    end
  end

  on_linux do
    url "https://github.com/jfarcand/mirroir-mcp/releases/download/runner-v#{version}/mirroir-run-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0e7a9960f9467e6a5e2bb8a41f3acc0654a05a04b5b1eb98ade6529bb769f113"
  end

  def install
    bin.install "mirroir-run"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mirroir-run --version")
  end
end
