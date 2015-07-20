# coding: utf-8
class Kroman < Formula
  desc "Covert Korean Hangul to Romannized Syllables"
  homepage "https://github.com/cheunghy/kroman"
  url "https://github.com/cheunghy/kroman/archive/\
fafae2ac45ddba85871d24eeeb117b9613a93f3f.tar.gz"
  sha256 "41be668b159dc8f58263290a51b69a35b566a1f82f6ed5944644eb5e253a6916"
  head "https://github.com/cheunghy/kroman.git"

  version "1.0"

  def install
    system "make", "kroman"
    system "make", "install", "PREFIX=#{prefix}", "MANDIR=#{man}"
  end

  test do
    (testpath/"korean.txt").write <<-EOS.undent
      I Love 한국어
    EOS
    system "#{bin}/kroman", "<", testpath/"korean.txt", ">", testpath/"r.txt"
    assert_equal "I Love han-gug-eo\n", File.read("r.txt")
  end
end
