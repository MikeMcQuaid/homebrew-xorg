class Sessreg < Formula
  desc "X.Org Applications: sessreg"
  homepage "https://www.x.org/"
  ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7app.html
  url "https://www.x.org/pub/individual/app/sessreg-1.1.1.tar.bz2"
  mirror "http://ftp.x.org/pub/individual/app/sessreg-1.1.1.tar.bz2"
  sha256 "78a76ae3f3f6a26547a34630d1b740f42344848b5fb6d7c9c7f7da255e35a6e1"
  # tag "linuxbrew"

  bottle do
    cellar :any_skip_relocation
    sha256 "17242c86ba919ff7bc10828ef3700ed097cb661508918c1bf8d0c75c748584df" => :x86_64_linux
  end

  depends_on "pkg-config" => :build
  depends_on "linuxbrew/xorg/xproto" => :build

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
      --disable-dependency-tracking
      --disable-silent-rules
    ]

    system "./configure", *args
    system "make"
    system "make", "install"
  end
end
