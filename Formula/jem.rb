class Jem < Formula
  desc "Terminal text editor in the spirit of MicroEMACS"
  homepage "https://github.com/jdpalmer/jem"
  url "https://github.com/jdpalmer/jem/archive/refs/tags/26.11.1.tar.gz"
  sha256 "25a166724fdae189440de0b00832a3ab150bb583a9a93f30b93098964daed987"
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
