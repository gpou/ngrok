# ngrok Supervisor Attributes.
#
# Attribute:: supervisor
# Cookbook: ngrok
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: Apache License, Version 2.0
# Source:: https://github.com/onbeep-cookbooks/ngrok
#

# Revert to 3.0, per https://github.com/poise/supervisor/issues/68
default['supervisor']['version'] = '3.0'
