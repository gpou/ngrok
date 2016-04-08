# Configures ngrok.
#
# Recipe:: config
# Cookbook: ngrok
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: Apache License, Version 2.0
# Source:: https://github.com/onbeep-cookbooks/ngrok
#


node['ngrok']['tunnels'].each do |k,v|
  ngrok_tunnel k do
    addr v['addr'] if v['addr']
    auth v['auth'] if v['auth']
    bind_tls v['bind_tls'] if v['bind_tls']
    proto v['proto'] if v['proto']
    host_header v['host_header'] if v['host_header']
    inspect v['inspect'] if v['inspect']
    subdomain v['subdomain'] if v['subdomain']
    crt v['crt'] if v['crt']
    key v['key'] if v['key']
    remote_addr v['remote_addr'] if v['remote_addr']
  end
end
