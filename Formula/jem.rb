class Jem < Formula
  desc "Terminal text editor in the spirit of MicroEMACS"
  homepage "https://github.com/jdpalmer/jem"
  url "https://github.com/jdpalmer/jem/archive/refs/tags/26.11.1.tar.gz"
  sha256 "d04b904d00cf2e3043e77b0cc4bcc1832a21820e0b5c8521b709f6768d906d34"
  license "MIT"
  head "https://github.com/jdpalmer/jem.git", branch: "main"

  depends_on "jdpalmer/tap/modc" => :build

  def install
    system "modc", "build", "-M", ".", "--release", "-o", "jem"
    bin.install "jem"
  end

  test do
    assert_predicate bin/"jem", :executable?
  end
end
