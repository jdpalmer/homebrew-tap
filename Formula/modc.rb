class Modc < Formula
  desc "Safe systems language that compiles via QBE"
  homepage "https://github.com/jdpalmer/modc"
  url "https://github.com/jdpalmer/modc/archive/refs/tags/26.11.2.tar.gz"
  sha256 "5a688ab0fa2984ae1e89bb82105b286011e0aa5086ffed1017a3b395dd0f253d"
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
