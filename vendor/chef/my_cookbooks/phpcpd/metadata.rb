name             "phpcpd"
maintainer       "Escape Studios"
maintainer_email "dev@escapestudios.com"
license          "MIT"
description      "Installs/Configures phpcpd"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.5"

%w{ debian ubuntu redhat centos fedora scientific amazon }.each do |os|
supports os
end

depends "php"
depends "composer"

recipe "phpcpd", "Installs phpcpd using PEAR."
recipe "phpcpd::composer", "Installs phpcpd using composer"
recipe "phpcpd::pear", "Installs phpcpd using pear"