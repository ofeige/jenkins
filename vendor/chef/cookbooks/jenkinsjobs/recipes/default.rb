#
# Cookbook Name:: jenkinsjobs
# Recipe:: default
#

# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apt"
include_recipe "dotdeb"
include_recipe "dotdeb::php54"
include_recipe "git"
include_recipe "php"
include_recipe "phpcs::composer"
include_recipe "phpunit::composer"
include_recipe "phpcpd::composer"
include_recipe "pdepend::composer"
include_recipe "phploc::composer"
include_recipe "phpmd::composer"
include_recipe "phpcb::pear"
include_recipe "jenkins"
include_recipe "jenkins::server"
include_recipe "ant"


jenkins_plugin 'analysis-core' do
  action :install
  version "1.54"
  url 'http://updates.jenkins-ci.org/download/plugins/analysis-core/1.54/analysis-core.hpi'
end

jenkins_plugin 'credentials' do
  action :install
  version "1.8.3"
  url 'http://updates.jenkins-ci.org/download/plugins/credentials/1.8.3/credentials.hpi'
end

jenkins_plugin 'ssh-agent' do
  action :install
  version "1.3"
  url 'http://updates.jenkins-ci.org/download/plugins/ssh-agent/1.3/ssh-agent.hpi'
end

jenkins_plugin 'git' do
  action :install
  version "1.5.0"
  url 'http://updates.jenkins-ci.org/download/plugins/git/1.5.0/git.hpi'
end

jenkins_plugin 'git-client' do
  action :install
  version "1.3.0"
  url 'http://updates.jenkins-ci.org/download/plugins/git-client/1.3.0/git-client.hpi'
end

jenkins_plugin 'dry' do
  action :install
  version "2.38"
  url 'http://updates.jenkins-ci.org/download/plugins/dry/2.38/dry.hpi'
end

jenkins_plugin 'checkstyle' do
  action :install
  version "3.38"
  url 'http://updates.jenkins-ci.org/download/plugins/checkstyle/3.38/checkstyle.hpi'
end

jenkins_plugin 'cloverphp' do
  action :install
  version "0.3.3"
  url 'http://updates.jenkins-ci.org/download/plugins/cloverphp/0.3.3/cloverphp.hpi'
end

jenkins_plugin 'htmlpublisher' do
  action :install
  version "1.2"
  url 'http://updates.jenkins-ci.org/download/plugins/htmlpublisher/1.2/htmlpublisher.hpi'
end

jenkins_plugin 'jdepend' do
  action :install
  version "1.2.3"
  url 'http://updates.jenkins-ci.org/download/plugins/jdepend/1.2.3/jdepend.hpi'
end

jenkins_plugin 'plot' do
  action :install
  version "1.5"
  url 'http://updates.jenkins-ci.org/download/plugins/plot/1.5/plot.hpi'
end

jenkins_plugin 'pmd' do
  action :install
  version "3.37"
  url 'http://updates.jenkins-ci.org/download/plugins/pmd/3.37/pmd.hpi'
end

jenkins_plugin 'violations' do
  action :install
  version "0.7.11"
  url 'http://updates.jenkins-ci.org/download/plugins/violations/0.7.11/violations.hpi'
end

jenkins_plugin 'xunit' do
  action :install
  version "1.62"
  url 'http://updates.jenkins-ci.org/download/plugins/xunit/1.62/xunit.hpi'
end



git_branch = 'origin/master'
job_name = "opf-master"

job_config = File.join(node[:jenkins][:server][:home], "#{job_name}-config.xml")

jenkins_job job_name do
  action :nothing
  config job_config
end

template job_config do
  source "opf-jenkins-config.xml"
  variables :job_name => job_name, :branch => git_branch, :node => node[:fqdn]
  notifies  :update, resources(:jenkins_job => job_name), :immediately
  notifies  :build, resources(:jenkins_job => job_name), :immediately
end

