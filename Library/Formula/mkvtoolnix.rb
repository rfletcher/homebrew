require 'formula'

class Mkvtoolnix <Formula
  url 'http://www.bunkus.org/videotools/mkvtoolnix/sources/mkvtoolnix-3.2.0.tar.bz2'
  homepage 'http://www.bunkus.org/videotools/mkvtoolnix/'
  md5 '9bf31280cb07870771e69de0287dc769'

  depends_on 'libebml'
  depends_on 'libmatroska'
  depends_on 'expat'
  depends_on 'libogg'
  depends_on 'libvorbis'
  depends_on 'boost'

  def install
    ENV.O3
    system "./configure", "--prefix=#{prefix}", "--disable-debug"
    system "make && make install"
  end

  def patches
    # include a bug fix from the mkvtoolnix repo
    DATA
  end  
end

__END__
--- a/configure
+++ b/configure
@@ -9058,7 +9058,7 @@
 $as_echo "$MANPAGES_TRANSLATIONS" >&6; }
 
 MANPAGES_TRANSLATED="`for lang in $MANPAGES_TRANSLATIONS; do \
-  echo -n '$(subst doc/man, doc/man/'$lang', $(MANPAGES)) '; done`"
+  echo '$(subst doc/man, doc/man/'$lang', $(MANPAGES)) '; done | tr -d '\n\r'`"
 
 MANPAGES_TRANSLATED_XML_RULE="`for lang in $MANPAGES_TRANSLATIONS; do \
   echo "doc/man/$lang/%.xml: doc/man/%.xml doc/man/po4a/po/$lang.po"
