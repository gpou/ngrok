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
  'auth_token' => node['ngrok']['authtoken'],
  'tunnels' => node['ngrok']['tunnels']
}

file node['ngrok']['config_file'] do
  content ngrok_config.to_yaml
  notifies :restart, 'supervisor_service[ngrok]', :delayed
end
