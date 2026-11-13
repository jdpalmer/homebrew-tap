class Modc < Formula
  desc "Safe systems language that compiles via QBE"
  homepage "https://github.com/jdpalmer/modc"
  url "https://github.com/jdpalmer/modc/archive/refs/tags/2026.11.01.tar.gz"
  sha256 "e317dd19929883fdac20bd831934cff66d8b09ad3db2f199a414b79cf01ec7a0"
  license "MIT"
  head "https://github.com/jdpalmer/modc.git", branch: "main"

  depends_on "jdpalmer/tap/modc-qbe"

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match "2026.11.01", shell_output("#{bin}/modc -V")
    (testpath/"hello.mc").write <<~EOS
      int main() {
          return 0;
      }
    EOS
    system bin/"modc", "build", "hello.mc", "-o", "hello"
    system "./hello"
  end
end
