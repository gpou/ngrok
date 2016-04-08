# Downloads and 'installs' ngrok.
#
# Recipe:: zip_file
# Cookbook: ngrok
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: Apache License, Version 2.0
# Source:: https://github.com/onbeep-cookbooks/ngrok
#

user 'ngrok' do
  action :create
  comment 'ngrok'
  home '/var/local/ngrok'
  shell '/bin/false'
end

directory '/var/local/ngrok/.ngrok2' do
  owner 'ngrok'
  group 'ngrok'
  mode '0755'
  recursive true
  action :create
end

hash = { "authtoken" => node['ngrok']['auth_token'] }.to_hash
mutable_hash = JSON.parse(hash.dup.to_json)
ngrok2_auth_config = mutable_hash.to_yaml

file '/var/local/ngrok/.ngrok2/ngrok.yml' do
  owner 'ngrok'
  group 'ngrok'
  mode '0644'
  content ngrok2_auth_config
end

include_recipe 'ark'

zip_url = URI.join(
  node['ngrok']['download_site'],
  node['ngrok']['zip_file']
).to_s

Chef::Log.debug("zip_url=#{zip_url}")

ark 'ngrok' do
  url zip_url
  strip_components 0
  action :put
end
