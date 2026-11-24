class Modc < Formula
  desc "Safe systems language that compiles via QBE"
  homepage "https://github.com/jdpalmer/modc"
  url "https://github.com/jdpalmer/modc/archive/refs/tags/26.11.1.tar.gz"
  sha256 "f60443d0b95f73218426a2c77cf2aa8ef42fe09b6d9a8518a234877733efe1ed"
  license "MIT"
  head "https://github.com/jdpalmer/modc.git", branch: "main"

  depends_on "jdpalmer/tap/modc-qbe"

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/modc -V")
    (testpath/"hello.mc").write <<~EOS
      int main() {
          return 0;
      }
    EOS
    system bin/"modc", "build", "hello.mc", "-o", "hello"
    system "./hello"
  end
end
