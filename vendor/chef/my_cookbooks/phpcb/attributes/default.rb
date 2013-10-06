#
# Cookbook Name:: phpcb
# Attributes:: default
#
# Copyright 2013, Escape Studios
#

default[:phpcb][:install_method] = "pear"
default[:phpcb][:version] = "latest"

#composer install only
default[:phpcb][:prefix] = "/usr/bin"