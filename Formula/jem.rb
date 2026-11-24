class Jem < Formula
  desc "Terminal text editor in the spirit of MicroEMACS"
  homepage "https://github.com/jdpalmer/jem"
  url "https://github.com/jdpalmer/jem/archive/refs/tags/26.11.2.tar.gz"
  sha256 "d3906413253b6f09cfa6c276dc7bb614c8c9aca890d58023f98ea28dfbff61d3"
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
