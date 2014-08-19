#
# Cookbook Name:: vimsetup
# Recipe:: neobundle
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "git"

HOME = node['vimsetup']['home']
USER = node['vimsetup']['user']
GROUP = node['vimsetup']['group']

BUNDLE_DIRS = ["#{HOME}/.vim", "#{HOME}/.vim/bundle"]
NEOBUNDLE_DIR = "#{HOME}/.vim/bundle/neobundle.vim"

BUNDLE_DIRS.each do |path|
  directory path do
    not_if { File.exists? path }

    owner USER
    group GROUP
    mode 0755
    action :create
  end
end

git NEOBUNDLE_DIR  do
  user USER
  group GROUP
  repository "git://github.com/Shougo/neobundle.vim"
  reference "master"
  action :sync
end

bash "neobundle-install" do
  user USER
  code <<-EOS
  #{NEOBUNDLE_DIR}/bin/install.sh
  EOS
  action :run
end

