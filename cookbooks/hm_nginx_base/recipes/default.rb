#
# Cookbook:: hm_nginx_base
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'apt'

package 'nginx' do
 action :install
end

#execute 'nginx_service_enable' do
 # command 'sudo /etc/init.d/nginx start'
  #user 'sudo'
  #action :run
#end 

service 'nginx' do
 supports :enable => true, :start => true
 action [ :enable, :start ]
end

