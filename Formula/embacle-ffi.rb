# typed: false
# frozen_string_literal: true

class EmbacleFfi < Formula
  desc "C FFI static library for embacle LLM runners (Swift/C integration)"
  homepage "https://github.com/dravr-ai/dravr-embacle"
  url "https://github.com/dravr-ai/dravr-embacle/archive/refs/tags/v0.14.3.tar.gz"
  sha256 "1032b50a54dbe45771ebb01b6c7c6358b28a18dc536319ffd95c61c1f0184b7c"
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
