# Configures an ngrok tunnel.
#
# Provider:: tunnel
# Cookbook: ngrok
# Author:: Mike Juarez <mike@orionlabs.co>
# Copyright:: Copyright 2015 OnBeep, Inc.
# License:: Apache License, Version 2.0
# Source:: https://github.com/onbeep-cookbooks/ngrok
#


require 'yaml'
require 'json'

def whyrun_supported?
  true
end

action :create do
  node.set['ngrok']['tunnels'][@tunnel_name] = @tunnel_config
  render_ngrok_config()
end

action :delete do
  if node['ngrok']['tunnels'][@tunnel_name]
    node.set['ngrok']['tunnels'].tap { |tun| tun.delete(@tunnel_name) }
  end
  render_ngrok_config
end

def render_ngrok_config
  ngrok_config = {
    'authtoken' => node['ngrok']['auth_token'],
    'tunnels' => node['ngrok']['tunnels']
  }

  hash = ngrok_config.to_hash
  mutable_hash = JSON.parse(hash.dup.to_json)
  ngrok_config = mutable_hash.to_yaml

  file node['ngrok']['config_file'] do
    content ngrok_config
  end
end

def load_current_resource
  @current_resource = Chef::Resource::NgrokTunnel.new(@new_resource.name)
  @tunnel_name = new_resource.name
  @tunnel_config = {}
  @tunnel_config[:addr] = new_resource.addr if new_resource.addr
  @tunnel_config[:auth] = new_resource.auth if new_resource.auth
  @tunnel_config[:bind_tls] = new_resource.bind_tls if new_resource.bind_tls
  @tunnel_config[:host_header] = new_resource.host_header if new_resource.host_header
  @tunnel_config[:inspect] = new_resource.inspect unless new_resource.inspect.nil?
  @tunnel_config[:proto] = new_resource.proto if new_resource.proto
  @tunnel_config[:subdomain] = new_resource.subdomain if new_resource.subdomain
  @tunnel_config[:crt] = new_resource.crt if new_resource.crt
  @tunnel_config[:key] = new_resource.key if new_resource.key
  @tunnel_config[:remote_addr] = new_resource.remote_addr if new_resource.remote_addr
end
