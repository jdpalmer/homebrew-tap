class Perfectfocus < Formula
  desc "Terminal task organizer with a spreadsheet-style workflow"
  homepage "https://github.com/jdpalmer/perfectfocus"
  url "https://github.com/jdpalmer/perfectfocus/archive/refs/tags/26.11.1.tar.gz"
  sha256 "b2b64401bee43da4a07f91d4a9bd7a498f9b172f8b65337092b5ae6a736764cf"
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
