# Tests for ngrok Cookbook.
#
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: Apache License, Version 2.0
# Source:: https://github.com/OnBeep/cookbook-ngrok
#


require 'spec_helper'


describe file('/usr/local/ngrok/ngrok') do
  it { should be_file }
  it { should be_executable }
end

describe command('/usr/local/ngrok/ngrok help') do
  it { should return_stdout /Print help/ }
end

describe file('/etc/ngrok.conf') do
  it { should be_file }
  its(:content) { should match /kitchen-ci-test-vm/ }
end

describe file('/etc/supervisor.d/ngrok.conf') do
  it { should be_file }
  its(:content) { should match /kitchen-ci-test-vm/ }
end

describe service('supervisor') do
  it { should be_enabled }
  it { should be_running }
end

describe service('ngrok') do
  it { should be_running.under('supervisor') }
end
