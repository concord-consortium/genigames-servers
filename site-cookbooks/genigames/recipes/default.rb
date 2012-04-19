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
  