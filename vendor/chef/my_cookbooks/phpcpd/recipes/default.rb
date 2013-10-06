#
# Cookbook Name:: phpcb
# Recipe:: default
#
# Copyright 2013, Escape Studios
#

case node[:phpcpd][:install_method]
	when "pear"
		include_recipe "phpcpd::pear"
	when "composer"
		include_recipe "phpcpd::composer"
end