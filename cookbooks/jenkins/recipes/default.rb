#
# Cookbook:: jenkins
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

depends 'java'
depends 'apt'

package 'jenkins' do
 action :upgrade
end

service 'jenkins' do
 action [ :enable, :start]
end
