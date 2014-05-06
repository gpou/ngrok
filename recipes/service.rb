# Sets up ngrok service with supervisord.
#
# Recipe:: service
# Cookbook: ngrok
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: Apache License, Version 2.0
# Source:: https://github.com/onbeep-cookbooks/ngrok
#


include_recipe 'ark'
include_recipe 'supervisor'


ngrok_cmd = [
  File.join(node['ark']['prefix_home'], 'ngrok', 'ngrok'),
  '-log=stdout',
  "-config=#{node['ngrok']['config_file']}",
  'start',
  node['ngrok']['tunnels'].keys().join(' ')
].join(' ')

supervisor_service 'ngrok' do
  command ngrok_cmd
  action :enable
end
