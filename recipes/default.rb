#
# Cookbook Name:: vimsetup
# Recipe:: default
#
# License:Apache License Version2
#
if platform_family? "rhel"
  include_recipe "yum"
else
  include_recipe "apt"
end


node.set['vim']['install_method']='source'
if platform_family? "rhel"
  node.set['vim']['source']['configuration'] = "--disable-selinux --enable-luainterp=yes --enable-pythoninterp=yes --enable-rubyinterp=yes --enable-multibyte --with-lua-prefix=/usr --with-features=huge --prefix=#{node['vim']['source']['prefix']}"
else
  node.set['vim']['source']['configuration'] = "--disable-selinux --enable-luainterp=yes --enable-pythoninterp=yes --enable-rubyinterp=yes --enable-multibyte --with-lua-prefix=/usr --with-luajit --with-features=huge --prefix=#{node['vim']['source']['prefix']}"
end

if platform_family? "rhel"
  node.set['vim']['source']['dependencies'] = %w( gcc make ncurses ncurses-devel lua lua-devel perl perl-devel perl-ExtUtils-Embed ruby ruby-devel python python-devel)
else
  node.set['vim']['source']['dependencies'] = %w( gcc make libncurses5-dev libperl-dev python-dev ruby-dev lua5.1 liblua5.1-dev luajit libluajit-5.1-dev)
end

include_recipe "vim::default"
