require File.expand_path("../../Requirements/php-meta-requirement", __FILE__)

class Arcanist < Formula
  desc "Phabricator Arcanist Tool"
  homepage "https://secure.phabricator.com/book/phabricator/article/arcanist/"

  head do
    url "https://github.com/phacility/arcanist.git", :branch => "stable"

    resource "libphutil" do
      url "https://github.com/phacility/libphutil.git", :branch => "stable"
    end
  end

  depends_on PhpMetaRequirement

  def install
    libexec.install Dir["*"]

    resource("libphutil").stage do
      (buildpath/"libphutil").install Dir["*"]
    end

    prefix.install Dir["*"]

    bin.install_symlink libexec/"bin/arc" => "arc"
  end

  test do
    system "#{bin}/arc", "help"
  end
end
