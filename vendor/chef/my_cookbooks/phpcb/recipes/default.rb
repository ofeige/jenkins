#
# Cookbook Name:: phpcb
# Recipe:: default
#
# Copyright 2013, Escape Studios
#

case node[:phpcb][:install_method]
	when "pear"
		include_recipe "phpcb::pear"
	when "composer"
		include_recipe "phpcb::composer"
end