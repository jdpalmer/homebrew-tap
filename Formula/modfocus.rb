class Modfocus < Formula
  desc "Terminal task organizer with a spreadsheet-style workflow"
  homepage "https://github.com/jdpalmer/modfocus"
  url "https://github.com/jdpalmer/modfocus/archive/refs/tags/26.11.5.tar.gz"
  sha256 "ad80e5455d59c796d197839a5b97d77cc1ac6fa01065f311575d4396f3a34597"
  license "MIT"
  head "https://github.com/jdpalmer/modfocus.git", branch: "main"

  depends_on "jdpalmer/tap/modc" => :build

  def install
    system "modc", "build", "-M", ".", "--release", "-o", "modfocus"
    bin.install "modfocus"
  end

  test do
    assert_predicate bin/"modfocus", :executable?
    assert_match "usage: modfocus", shell_output("#{bin}/modfocus --help 2>&1")
  end
end
