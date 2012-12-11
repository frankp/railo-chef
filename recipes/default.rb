#
# Cookbook Name:: railo-dev
# Recipe:: default
#
# Copyright (C) 2012 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "apache2"

remote_file "#{Chef::Config[:file_cache_path]}/railo-4.0.2.002-pl1-linux-x64-installer.run" do
  source "http://www.getrailo.org/railo/remote/download/4.0.2.002/tomcat/linux/railo-4.0.2.002-pl1-linux-x64-installer.run"
  mode "0744"
  action :create_if_missing
end

execute "railo_installer" do
  command_string = <<-FOO
    /usr/bin/sudo #{Chef::Config[:file_cache_path]}/railo-4.0.2.002-pl1-linux-x64-installer.run \
          --mode unattended \
          --tomcatpass railoadmin
    FOO
  command command_string
  action :run
end