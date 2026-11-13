class Modc < Formula
  desc "Safe systems language that compiles via QBE"
  homepage "https://github.com/jdpalmer/modc"
  url "https://github.com/jdpalmer/modc/archive/refs/tags/2026.11.02.tar.gz"
  sha256 "305190f7dd74c82b4a8d74bfcab3d0cdf23d167bccf9f5400373d843a04462d5"
  license "MIT"
  head "https://github.com/jdpalmer/modc.git", branch: "main"

  depends_on "jdpalmer/tap/modc-qbe"

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match "2026.11.02", shell_output("#{bin}/modc -V")
    (testpath/"hello.mc").write <<~EOS
      int main() {
          return 0;
      }
    EOS
    system bin/"modc", "build", "hello.mc", "-o", "hello"
    system "./hello"
  end
end
