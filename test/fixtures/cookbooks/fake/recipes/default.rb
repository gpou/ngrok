include_recipe 'ngrok::zip_file'

ngrok_tunnel "fake_cookbook_tunnel" do
  addr 8080
  auth "foo:biscuit"
  bind_tls "both"
  proto "http"
  host_header "vagrant.local"
  inspect false
  subdomain "vagrant"
  crt "example.crt"
  key "example.key"
  remote_addr "192.168.0.1:80"
end

include_recipe 'ngrok::service'