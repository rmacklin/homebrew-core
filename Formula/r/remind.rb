class Remind < Formula
  desc "Sophisticated calendar and alarm"
  homepage "https://dianne.skoll.ca/projects/remind/"
  url "https://dianne.skoll.ca/projects/remind/download/remind-04.03.06.tar.gz"
  sha256 "320a7e30fc57559bcbe3f02ba3b2894deb1cd9cdf4a3d173427f24289b79210e"
  license "GPL-2.0-only"
  head "https://git.skoll.ca/Skollsoft-Public/Remind.git", branch: "master"

  livecheck do
    url :homepage
    regex(%r{href=.*?/download/remind-(\d+(?:[._]\d+)+)\.t}i)
  end

  bottle do
    sha256 arm64_sonoma:   "2d40503f85229b8ae6ca63a26ca21cdd3f43c11961319d5c6cb9f4267677b46b"
    sha256 arm64_ventura:  "8d0264906f733c89a2bca33d740cb23da65503dcc9e08c447d2789254037ea2e"
    sha256 arm64_monterey: "315d8dfe60c0dd8af1dc96756d22e571d5c318fc755cf7225e0c34d3fa772a79"
    sha256 sonoma:         "43c49ba928f233ef82db653ca5f65c1fcec3984522e0570f2b62dae43a9352cd"
    sha256 ventura:        "39d3940f3e069fc991af4543286ce02933efbbf3e86f8d240300386e8af33f83"
    sha256 monterey:       "f23f0df888956e81870b62131bee575868af1e74e8e1eee214458c3fc922c6ad"
    sha256 x86_64_linux:   "5922b050ec27dfb0e8843711b1afd36141bfe62d912d5bab3c7b87114969fe81"
  end

  conflicts_with "rem", because: "both install `rem` binaries"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    (testpath/"reminders").write "ONCE 2015-01-01 Homebrew Test"
    assert_equal "Reminders for Thursday, 1st January, 2015:\n\nHomebrew Test\n\n",
      shell_output("#{bin}/remind reminders 2015-01-01")
  end
end
