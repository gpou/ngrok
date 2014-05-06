# Downloads and 'installs' ngrok.
#
# Recipe:: zip_file
# Cookbook: ngrok
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: Apache License, Version 2.0
# Source:: https://github.com/onbeep-cookbooks/ngrok
#


include_recipe 'ark'


zip_path = value_for_platform_family(
  'mac_os_x' => '/darwin_amd64/',
  'default' => '/linux_386/'
)

zip_url = URI.join(
  node['ngrok']['download_site'],
  zip_path,
  node['ngrok']['zip_file']
).to_s

Chef::Log.debug("zip_url=#{zip_url}")

ark 'ngrok' do
  url zip_url
  strip_components 0
  action :put
end
