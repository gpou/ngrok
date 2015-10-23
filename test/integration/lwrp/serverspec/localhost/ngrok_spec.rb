# Tests for ngrok Cookbook.
#
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: Apache License, Version 2.0
# Source:: https://github.com/onbeep-cookbooks/ngrok
#


require 'spec_helper'


describe file('/usr/local/ngrok/ngrok') do
  it { should be_file }
  it { should be_executable }
end

describe command('/usr/local/ngrok/ngrok help') do
  its(:stderr) { should match /Print help/ }
end

describe file('/etc/ngrok.conf') do
  it { should be_file }
  its(:content) { should match /fake_cookbook_tunnel/ }
  its(:content) { should match /addr: 8080/ }
  its(:content) { should match /auth: foo:biscuit/ }
  its(:content) { should match /bind_tls: both/ }
  its(:content) { should match /proto: http/ }
  its(:content) { should match /host_header: vagrant.local/ }
  its(:content) { should match /inspect: false/ }
  its(:content) { should match /subdomain: vagrant/ }
  its(:content) { should match /crt: example.crt/ }
  its(:content) { should match /key: example.key/ }
  its(:content) { should match /remote_addr: 192.168.0.1:80/ }
end
