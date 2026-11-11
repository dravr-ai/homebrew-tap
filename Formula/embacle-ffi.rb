# typed: false
# frozen_string_literal: true

class EmbacleFfi < Formula
  desc "C FFI static library for embacle LLM runners (Swift/C integration)"
  homepage "https://github.com/dravr-ai/dravr-embacle"
  url "https://github.com/dravr-ai/dravr-embacle/archive/refs/tags/v0.45.1.tar.gz"
  sha256 "81f0914c50f29769036cc1b9604eab9a5d80b71d15ec4ec13b87b1bef158bdba"
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
