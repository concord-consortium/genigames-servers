# perhaps these should just be put in the runlist instead??

include_recipe "nodejs"
include_recipe "nodejs::npm"
include_recipe "couchdb"
include_recipe "authbind"

directory "/var/www" do
  owner "deploy"
  group "root"
  mode "755"
end

directory "/var/www/log" do
  owner "www-data"
  group "www-data"
  mode "755"
end

template "/etc/init/genigames.dev.concord.org.conf" do
  source "genigames.dev.concord.org.conf.erb"
  owner "root"
  group "root"
  mode "644"
end

file "/etc/authbind/byport/80" do
  owner "www-data"
  group "www-data"
  mode "755"
end

script "update_npm" do
  interpreter "bash"
  user "deploy"
  code "sudo npm update -g npm"
end

script "setup_coffee" do
  interpreter "bash"
  user "deploy"
  code "sudo npm install -g coffee-script"
end

# The following is no longer used, but is left for reference b/c that's how the Apache *files*
# got onto genigames.dev.concord.org

# set up resources server w/ proxy server to all of the rest
# include_recipe "apache2::mod_proxy"
# include_recipe "apache2::mod_proxy_http"

# include_recipe "apache2::disable_default_site"

# web_app "genigames-apache" do
#   server_name "genigames.dev.concord.org"
#   cookbook "apache2"
#   docroot "/var/www/static"
#   is_default true
#   proxies [
#     {:path => "/biologica/", :remote => "http://geniverse.dev.concord.org/biologica/"},
#     {:path => "/resources/", :remote => "http://geniverse.dev.concord.org/resources/"}
#   ]
# end
