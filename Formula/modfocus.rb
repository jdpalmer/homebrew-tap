class Modfocus < Formula
  desc "Terminal task organizer with a spreadsheet-style workflow"
  homepage "https://github.com/jdpalmer/modfocus"
  url "https://github.com/jdpalmer/modfocus/archive/refs/tags/26.11.2.tar.gz"
  sha256 "e88d8888ab794fa243f563463f05bcc404a9a78343971786d17157726ecf3598"
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
