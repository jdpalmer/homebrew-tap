require "formula"

class Transmute < Formula
  desc "A small MacOS utility for doing image format conversions."
  homepage "https://github.com/jdpalmer/transmute"
  url "https://github.com/jdpalmer/transmute/archive/refs/tags/v1.3.zip"
  sha256 "bfdecec1a8d94b8c5604f3d65fea475986f86fd05db61cf684f7b436ab7e30c8"
  version "1.3"

  def install
    ENV['PREFIX'] = prefix
    system "make"
    bin.install "transmute"
    man1.install "transmute.1"
  end

end
