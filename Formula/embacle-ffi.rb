# typed: false
# frozen_string_literal: true

class EmbacleFfi < Formula
  desc "C FFI static library for embacle LLM runners (Swift/C integration)"
  homepage "https://github.com/dravr-ai/dravr-embacle"
  url "https://github.com/dravr-ai/dravr-embacle/archive/refs/tags/v0.25.0.tar.gz"
  sha256 "94023fb8c1f305b21a15b247267f29022042139acf787b695a0791c19c1548f0"
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
