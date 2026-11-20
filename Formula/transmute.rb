class Transmute < Formula
  desc "Convert image formats with Quartz"
  homepage "https://github.com/jdpalmer/transmute"
  url "https://github.com/jdpalmer/transmute/archive/refs/tags/26.11.0.tar.gz"
  sha256 "269e71863d01cea459038a6a26ec411b6af40c8b2b12d8dc22213ae076e40cc7"
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
