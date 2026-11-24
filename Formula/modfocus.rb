class Modfocus < Formula
  desc "Terminal task organizer with a spreadsheet-style workflow"
  homepage "https://github.com/jdpalmer/modfocus"
  url "https://github.com/jdpalmer/modfocus/archive/refs/tags/26.11.4.tar.gz"
  sha256 "7fcb32ea37375da9d9090426792affad788d78ad64dbcacf6bbb6b359269394f"
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
