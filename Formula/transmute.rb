require "formula"

class Transmute < Formula
  desc "A small MacOS utility for doing image format conversions."
  homepage "https://github.com/jdpalmer/transmute"
  url "https://github.com/jdpalmer/transmute/archive/refs/tags/v1.3.zip"
  sha256 "f4a7d7097f7db55c66d184021e19bdae0d5e8dba438e55dd5120ccaa32f57c9a"
  version "1.3"

  def install
    ENV['PREFIX'] = prefix
    system "make"
    bin.install "transmute"
    man1.install "transmute.1"
  end

end
