class Transmute < Formula
  desc "Convert image formats with Quartz"
  homepage "https://github.com/jdpalmer/transmute"
  url "https://github.com/jdpalmer/transmute/archive/refs/tags/26.11.1.tar.gz"
  sha256 "3732c1a2a7511f054ae2942f4379697e2c0dc0ceffc62a6bca1ce8e0bcf6fbc5"
  license "Apache-2.0"
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
