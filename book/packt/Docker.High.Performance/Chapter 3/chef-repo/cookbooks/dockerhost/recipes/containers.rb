#
# Cookbook Name:: .
# Recipe:: containers
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

docker_image 'nginx' do
  tag '1.9.3'
end

node.set['docker']['container_init_type'] = 'systemd'

directory '/usr/lib/systemd/system'

docker_container 'nginx' do
  tag '1.9.3'
  container_name 'webserver'
  detach true
  port '80:80'
end
