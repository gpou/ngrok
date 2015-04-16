# Configures an ngrok tunnel.
#
# Resources:: tunnel
# Cookbook: ngrok
# Author:: Mike Juarez <mike@orionlabs.co>
# Copyright:: Copyright 2015 OnBeep, Inc.
# License:: Apache License, Version 2.0
# Source:: https://github.com/onbeep-cookbooks/ngrok
#

actions :create, :delete
default_action :create

attribute :name, :name_attribute => true, :kind_of => String, :required => true

attribute :addr,         :kind_of => Fixnum, :required => true
attribute :auth,         :kind_of => String
attribute :bind_tls,     :kind_of => String
attribute :host_header,  :kind_of => String
attribute :inspect,      :kind_of => [ TrueClass, FalseClass ], :default => false
attribute :proto,        :kind_of => String, :required => true
attribute :subdomain,    :kind_of => String
attribute :crt,          :kind_of => String
attribute :key,          :kind_of => String
attribute :remote_addr,  :kind_of => String

def initalize(*args)
  super
  @action = :create
end
