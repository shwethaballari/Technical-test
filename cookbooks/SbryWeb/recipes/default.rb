#
# Cookbook Name:: SbryWeb
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nginx"

nginx_site "default" do
  enable true
end



template '/etc/nginx/sites-available/test_app' do
  source 'reverse_proxy_load_balancer.erb'
  mode 0644
  owner node.nginx.user
  group node.nginx.user
end
resources(:service => 'nginx')
nginx_site 'test_app'
