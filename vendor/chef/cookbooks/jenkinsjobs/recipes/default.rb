#
# Cookbook Name:: jenkinsjobs
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "dotdeb"
include_recipe "dotdeb::php54"
include_recipe "git"
include_recipe "php"
include_recipe "phpcs::composer"
include_recipe "phpunit::composer"
include_recipe "phpcpd"
include_recipe "pdepend::composer"
include_recipe "phploc::composer"
include_recipe "phpmd::composer"
include_recipe "phpcb"
include_recipe "ant"

node['jenkins']['server']['plugins'] = ["checkstyle", "clover", "dry", "htmlpublisher", "jdepend", "plot", "pmd", "violations", "xunit", "git"]

git_branch = 'origin/master'
job_name = "opf-master"

job_config = File.join(node[:jenkins][:node][:home], "#{job_name}-config.xml")

jenkins_job job_name do
  action :nothing
  config job_config
end

template job_config do
  source "opf-jenkins-config.xml"
  variables :job_name => job_name, :branch => git_branch, :node => node[:fqdn]
  notifies :update, resources(:jenkins_job => job_name), :immediately
  notifies :build, resources(:jenkins_job => job_name), :immediately
end

