class Modc < Formula
  desc "Safe systems language that compiles via QBE"
  homepage "https://github.com/jdpalmer/modc"
  url "https://github.com/jdpalmer/modc/archive/refs/tags/26.11.0.tar.gz"
  sha256 "47b9859a430dd9f2686476faccca3891d255f9f3bce94487b6c1d2155dc6fd75"
  license "MIT"
  head "https://github.com/jdpalmer/modc.git", branch: "main"

  depends_on "jdpalmer/tap/modc-qbe"

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match "26.11.0", shell_output("#{bin}/modc -V")
    (testpath/"hello.mc").write <<~EOS
      int main() {
          return 0;
      }
    EOS
    system bin/"modc", "build", "hello.mc", "-o", "hello"
    system "./hello"
  end
end
