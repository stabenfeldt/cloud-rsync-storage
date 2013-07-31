#
# Cookbook Name:: xinitd_rsync
# Recipe:: default
#
# Copyright 2013, Martin Stabenfeldt
#
%w{vim ack xinetd}.each do |pkg|
  package pkg do
    action :install
  end
end

user 'rsync' do
  username 'rsync'
  supports :manage_home => true
  home '/home/rsync'
  action :create
end

directory "/home/rsync/BACKUP/" do
  owner "rsync"
  group "rsync"
  mode 0700
  action :create
end


template '/etc/xinetd.d/rsync' do
  source 'xinetd_rsync.txt.erb'
  owner 'root'
  mode 0600
  action :create
end

template '/etc/rsyncd.conf' do
  source 'rsync.conf.txt.erb'
  action :create
end
