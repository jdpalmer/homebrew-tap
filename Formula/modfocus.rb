class Modfocus < Formula
  desc "Terminal task organizer with a spreadsheet-style workflow"
  homepage "https://github.com/jdpalmer/modfocus"
  url "https://github.com/jdpalmer/modfocus/archive/refs/tags/26.11.3.tar.gz"
  sha256 "3732f95780007d7af3ea618a97bb36292dec7c6ff0e3ff365907bee590b4679e"
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
