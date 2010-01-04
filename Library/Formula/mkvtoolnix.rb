require 'formula'

class Mkvtoolnix <Formula
  url 'http://www.bunkus.org/videotools/mkvtoolnix/sources/mkvtoolnix-3.0.0.tar.bz2'
  homepage 'http://www.bunkus.org/videotools/mkvtoolnix/'
  md5 '2e9373edd5a5523313d8f5bea3ee8f8e'

  depends_on 'libebml'
  depends_on 'libmatroska'
  depends_on 'expat'
  depends_on 'libogg'
  depends_on 'libvorbis'
  depends_on 'boost'

  def install
    ENV.O3
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make && make install"
  end
end
