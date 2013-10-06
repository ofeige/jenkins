#
# Cookbook Name:: phpcb
# Attributes:: default
#
# Copyright 2013, Escape Studios
#

default[:phpcpd][:install_method] = "pear"
default[:phpcpd][:version] = "1.4.3"

#composer install only
default[:phpcpd][:prefix] = "/usr/bin"