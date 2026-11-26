class Jem < Formula
  desc "Terminal text editor in the spirit of MicroEMACS"
  homepage "https://github.com/jdpalmer/jem"
  url "https://github.com/jdpalmer/jem/archive/refs/tags/26.11.3.tar.gz"
  sha256 "eaba666bbe345b098acea094fefe31ba3cf8db328c5f2becab43b23d19b0c6fb"
  license "MIT"
  head "https://github.com/jdpalmer/jem.git", branch: "main"

  depends_on "jdpalmer/tap/modc" => :build

  def install
    system "modc", "build", "-M", ".", "--release", "-o", "jem"
    bin.install "jem"
  end

  test do
    assert_predicate bin/"jem", :executable?
  end
end
