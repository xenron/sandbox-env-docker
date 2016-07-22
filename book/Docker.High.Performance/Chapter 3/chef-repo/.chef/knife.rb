# See https://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "dockeruser"
client_key               "#{current_dir}/dockeruser.pem"
validation_client_name   "dockerorg-validator"
validation_key           "#{current_dir}/dockerorg-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/dockerorg"
cookbook_path            ["#{current_dir}/../cookbooks"]
