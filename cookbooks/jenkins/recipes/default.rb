#
# Cookbook:: jenkins
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
remote_file '/tmp/jenkins-ci.org.key' do
    source 'https://pkg.jenkins.io/debian/jenkins-ci.org.key'
    notifies :run, 'execute[/tmp/key]', :immediately
end

execute '/tmp/key' do
    command 'sudo apt-key add /tmp/jenkins-ci.org.key'
    action :nothing
end

#sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
file '/etc/apt/sources.list.d/jenkins.list' do
    content 'deb http://pkg.jenkins.io/debian-stable binary/'
    notifies :run, 'execute[apt-get update]', :immediately
end

#sudo apt-get update
execute 'apt-get update' do
    command 'sudo apt-get update'
    action :nothing
end

#sudo apt-get install jenkins
package 'jenkins' do
    action :install
end
