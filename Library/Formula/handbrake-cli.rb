require 'formula'

class HandbrakeCli <Formula
  url 'http://handbrake.fr/rotation.php?file=HandBrake-0.9.4.tar.bz2'
  homepage 'http://handbrake.fr/'
  md5 '69f88b2e602550615da75947f914d7e6'

  def install
    system "./configure", "--disable-xcode"
    Dir.chdir "build" do
      system "make"
      File.rename "HandBrakeCLI", "handbrake"
      bin.install "handbrake"
    end
  end
end
