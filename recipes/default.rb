# Requires requisite Recipes for ngrok Cookbook.
#
# Recipe:: default
# Cookbook: ngrok
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: Apache License, Version 2.0
# Source:: https://github.com/onbeep-cookbooks/ngrok
#


include_recipe 'ngrok::zip_file'
include_recipe 'ngrok::config'
include_recipe 'ngrok::service'
