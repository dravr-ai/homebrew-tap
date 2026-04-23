# typed: false
# frozen_string_literal: true

class EmbacleFfi < Formula
  desc "C FFI static library for embacle LLM runners (Swift/C integration)"
  homepage "https://github.com/dravr-ai/dravr-embacle"
  url "https://github.com/dravr-ai/dravr-embacle/archive/refs/tags/v0.15.4.tar.gz"
  sha256 "9806a92356f9901c4087fe73849204c3dd8d430216a6d9e137050583c20e29b9"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--features", "ffi"
    lib.install "target/release/libembacle.a"
    include.install "include/embacle.h"
  end

  test do
    assert_match "embacle_init", shell_output("nm #{lib}/libembacle.a")
  end
end
