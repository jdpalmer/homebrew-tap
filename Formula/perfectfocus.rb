class Perfectfocus < Formula
  desc "Terminal task organizer with a spreadsheet-style workflow"
  homepage "https://github.com/jdpalmer/perfectfocus"
  url "https://github.com/jdpalmer/perfectfocus/archive/refs/tags/26.11.1.tar.gz"
  sha256 "14153377cd5bc08d138b65c6bf0b524004f3828a3749e012f74be329e67e3146"
  license "MIT"
  head "https://github.com/jdpalmer/perfectfocus.git", branch: "main"

  depends_on "jdpalmer/tap/modc" => :build

  def install
    system "modc", "build", "-M", ".", "--release", "-o", "pf"
    bin.install "pf"
  end

  test do
    assert_predicate bin/"pf", :executable?
    assert_match "usage: pf", shell_output("#{bin}/pf --help 2>&1")
  end
end
