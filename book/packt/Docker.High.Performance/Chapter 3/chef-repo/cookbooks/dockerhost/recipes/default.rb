#
# Cookbook Name:: dockerhost
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

apt_repository 'docker' do
  uri 'http://apt.dockerproject.org/repo'
  components %w(debian-jessie main)
  keyserver 'p80.pool.sks-keyservers.net'
  key '58118E89F3A912897C070ADBF76221572C52609D'
  cache_rebuild true
end

package 'docker-engine'
