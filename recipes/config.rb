# Configures ngrok.
#
# Recipe:: config
# Cookbook: ngrok
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: Apache License, Version 2.0
# Source:: https://github.com/onbeep-cookbooks/ngrok
#


require 'yaml'


ngrok_config = {
  'auth_token' => node['ngrok']['auth_token'],
  'tunnels' => node['ngrok']['tunnels']
}

ngrok_config['inspect_addr'] = node['ngrok']['inspect_addr'] if node['ngrok']['inspect_addr']


file node['ngrok']['config_file'] do
  content ngrok_config.to_yaml
  notifies :restart, 'supervisor_service[ngrok]', :delayed
end
