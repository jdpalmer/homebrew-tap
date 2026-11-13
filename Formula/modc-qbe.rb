class ModcQbe < Formula
  desc "QBE backend fork with codegen fixes for modc"
  homepage "https://github.com/jdpalmer/qbe"
  url "https://github.com/jdpalmer/qbe/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "5d1858911becef87104a071441f7a3e81cdd726bf247fb9e67c8a507e5a80909"
  license "MIT"
  head "https://github.com/jdpalmer/qbe.git", branch: "master"

  def install
    system "make"
    bin.install "qbe" => "modc-qbe"
  end

  test do
    (testpath/"main.ssa").write <<~SSA
      function w $add(w %a, w %b) {
      @start
        %c =w add %a, %b
        ret %c
      }
      export function w $main() {
      @start
        %r =w call $add(w 1, w 1)
        call $printf(l $fmt, ..., w %r)
        ret 0
      }
      data $fmt = { b "One and one make %d!\\n", b 0 }
    SSA

    system bin/"modc-qbe", "-o", "out.s", "main.ssa"
    assert_path_exists testpath/"out.s"
  end
end
