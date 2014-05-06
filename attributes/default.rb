# ngrok Default Attributes.
#
# Attribute:: default
# Cookbook: ngrok
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: Apache License, Version 2.0
# Source:: https://github.com/onbeep-cookbooks/ngrok
#


default['ngrok']['download_site'] = 'https://dl.ngrok.com'
default['ngrok']['zip_file'] = 'ngrok.zip'
default['ngrok']['config_file'] = File.join(
  File::SEPARATOR, 'etc', 'ngrok.conf')
default['ngrok']['authtoken'] = ''
default['ngrok']['config'] = ''
default['ngrok']['hostname'] = ''
default['ngrok']['httpauth'] = ''
default['ngrok']['log'] = ''
default['ngrok']['proto'] = ''
default['ngrok']['subdomain'] = ''
default['ngrok']['local_port'] = ''
default['ngrok']['local_host'] = ''
default['ngrok']['tunnels'] = {}
