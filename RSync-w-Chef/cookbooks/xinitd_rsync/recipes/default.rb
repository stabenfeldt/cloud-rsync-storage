#
# Cookbook Name:: xinitd_rsync
# Recipe:: default
#
# Copyright 2013, Martin Stabenfeldt


template "/etc/xinetd.d/rsync" do
  source "xinetd_rsync.txt.erb"
  action :create
end

template "/etc/rsyncd.conf" do
  source "rsync.conf.txt.erb"
  action :create
end

template "/etc/rsyncd.secrets" do
  source "rsync.secrets.txt.erb"
  variables :rsync_username => node['xinetd']['rsync_username']
  variables :rsync_password => node['xinetd']['rsync_password']
  action :create
end
