class Transmute < Formula
  desc "Convert image formats with Quartz"
  homepage "https://github.com/jdpalmer/transmute"
  url "https://github.com/jdpalmer/transmute/archive/refs/tags/26.11.1.tar.gz"
  sha256 "274576c8d3ea816884864571bb7df54f553640df2f9ce48fda87d6c1941f2237"
  license "MIT"
  head "https://github.com/jdpalmer/transmute.git", branch: "master"

  depends_on :macos

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    output = shell_output("#{bin}/transmute -h")
    assert_match "transmute", output
  end
end
