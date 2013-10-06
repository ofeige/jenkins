name             "phpcb"
maintainer       "Escape Studios"
maintainer_email "dev@escapestudios.com"
license          "MIT"
description      "Installs/Configures phpcb"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.5"

%w{ debian ubuntu redhat centos fedora scientific amazon }.each do |os|
supports os
end

depends "php"
depends "composer"

recipe "phpcb", "Installs phpcb using PEAR."
recipe "phpcb::composer", "Installs phpcb using composer"
recipe "phpcb::pear", "Installs phpcs using pear"