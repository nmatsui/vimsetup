#
# Cookbook Name:: vimsetup
# Recipe:: alias
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash "alias-vim" do
  not_if "grep 'alias vi' #{node['vimsetup']['home']}/.bashrc"

  user "#{node['vimsetup']['user']}"
  code <<-EOS
  echo "alias vi='vim'" >> #{node['vimsetup']['home']}/.bashrc
  EOS
  action :run
end

