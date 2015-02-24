# ngrok Default Attributes.
#
# Attribute:: default
# Cookbook: ngrok
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: Apache License, Version 2.0
# Source:: https://github.com/onbeep-cookbooks/ngrok
#


default['ngrok']['download_site'] = 'https://api.equinox.io/1/Applications/ap_pJSFC5wQYkAyI0FIVwKYs9h1hW/Updates/Asset/'
default['ngrok']['zip_file'] = 'ngrok.zip'
default['ngrok']['config_file'] = File.join(
  File::SEPARATOR, 'etc', 'ngrok.conf')
default['ngrok']['auth_token'] = ''
default['ngrok']['tunnels'] = {}
default['ngrok']['inspect_addr'] = nil
default['ngrok']['server_addr'] = nil
default['ngrok']['trust_host_root_certs'] = nil
default['ngrok']['http_proxy'] = nil
