# coding: utf-8
class Kroman < Formula
  desc "Covert Korean Hangul to Romannized Syllables"
  homepage "https://github.com/cheunghy/kroman"
  url "https://github.com/cheunghy/kroman/archive/\
fafae2ac45ddba85871d24eeeb117b9613a93f3f.tar.gz"
  sha256 "4b614e2b3bc0227ac765ef13f68bc069a87001383e4d71254932dedd0730294f"
  head "https://github.com/cheunghy/kroman.git"

  version "1.0"

  def install
    system "make", "kroman"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    ENV["LC_ALL"] = "en_US.UTF-8"
    assert_equal "I Love han-gug-eo",
                 pipe_output("#{bin}/kroman", "I Love 한국어")
  end
end
