#
# Cookbook:: hm_nginx_base
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'apt'

package 'nginx' do
 action :install
end 

service 'nginx' do
 supports :enable => true, :start => true, :reload => true
 action [ :enable, :start ]
end

cookbook_file "/usr/share/nginx/html/index.html" do
 source "index.html"
 mode "0644"
notifies :reload, "service[nginx]"
end

