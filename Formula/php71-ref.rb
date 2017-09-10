require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php71Ref < AbstractPhp71Extension
  init
  desc "Soft and Weak references support for PHP"
  homepage "https://github.com/pinepain/php-ref"
  url "https://github.com/pinepain/php-ref/archive/v0.5.0.tar.gz"
  sha256 "0fd928fd8314f836a97e3833d6c5e15658202d05fe3a0725d793f6e06394cd97"
  head "https://github.com/pinepain/php-ref.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "07818fdd5dc458e0069ca2e580500a0eb699a074f4e6c72acd950328d1dc61eb" => :sierra
    sha256 "cb8da091473e4616853b7b3dc3ead3ffacb661ead7b1ab785a0b468a4eae1f28" => :el_capitan
    sha256 "ccff891becd77d1a1258b0ef373b7a6303c9b1d8dbfe8f1edaee93e38b89fb3e" => :yosemite
  end

  def install
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig

    system "make"
    prefix.install "modules/ref.so"
    write_config_file if build.with? "config-file"
  end
end
