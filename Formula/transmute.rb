class Transmute < Formula
  desc "Convert image formats with Quartz"
  homepage "https://github.com/jdpalmer/transmute"
  url "https://github.com/jdpalmer/transmute/archive/refs/tags/v26.2.tar.gz"
  sha256 "14f73e24d4564edb4a3dd6689fd293f328a8385378abb4ae2f09e6d44a8457ef"
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
