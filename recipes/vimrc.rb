#
# Cookbook Name:: vimsetup
# Recipe:: vimrc
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

HOME = node['vimsetup']['home']
USER = node['vimsetup']['user']
GROUP = node['vimsetup']['group']

remote_file "#{HOME}/.vimrc" do
  not_if { File.exists? "#{HOME}/.vimrc" }

  source node['vimsetup']['vimrc-url']
  mode "644"
  owner USER
  group GROUP
end
