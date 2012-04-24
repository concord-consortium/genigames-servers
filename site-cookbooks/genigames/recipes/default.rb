directory "/var/www" do
  owner "deploy"
  group "root"
  mode "777"
end

file "/var/www/index.html" do
  owner "deploy"
  group "root"
  mode "777"
end

# set up resources server w/ proxy server to all of the rest
include_recipe "apache2::mod_proxy"
include_recipe "apache2::mod_proxy_http"

include_recipe "apache2::disable_default_site"

web_app "genigames-apache" do
  server_name "genigames.dev.concord.org"
  cookbook "apache2"
  docroot "/var/www/static"
  is_default true
  proxies [
    {:path => "/biologica/", :remote => "http://geniverse.dev.concord.org/biologica/"},
    {:path => "/resources/", :remote => "http://geniverse.dev.concord.org/resources/"}
  ]
end

include_recipe "nodejs"
include_recipe "nodejs::npm"
include_recipe "couchdb"
