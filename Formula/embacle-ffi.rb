# typed: false
# frozen_string_literal: true

class EmbacleFfi < Formula
  desc "C FFI static library for embacle LLM runners (Swift/C integration)"
  homepage "https://github.com/dravr-ai/dravr-embacle"
  url "https://github.com/dravr-ai/dravr-embacle/archive/refs/tags/v0.21.2.tar.gz"
  sha256 "a662ceaed5e7ce8208fda15085bb827bcb5c05d9f969df252aaf4dd2a49f9dfe"
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
