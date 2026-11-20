class Perfectfocus < Formula
  desc "Terminal task organizer with a spreadsheet-style workflow"
  homepage "https://github.com/jdpalmer/perfectfocus"
  url "https://github.com/jdpalmer/perfectfocus/archive/refs/tags/26.11.0.tar.gz"
  sha256 "d74258c315d3b10970db76635aea04cc0865cc9da79db235633072d5bed4873e"
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
