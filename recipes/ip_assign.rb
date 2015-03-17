marker "recipe_start_rightscale" do
  template "rightscale_audit_entry.erb"
end


include_recipe 'rsc_google_cloud::default'

# assumes the static IP is already created in the google compute console
# supply the name of the static ip in the node["rsc_google_cloud"]["ip"]["name"] 
# attribute
datacenter =node[:rsc_google_cloud][:region].split('/').last.split('-')
datacenter.delete(datacenter.last) #remove last part of the zone to get the region
region = datacenter.join('-') #join array to get region

gce_ip node["rsc_google_cloud"]["ip"]["name"] do
  name node["rsc_google_cloud"]["ip"]["name"]
  server node[:rsc_google_cloud][:instance_id].split('/').last
  region region
  project_id node["rsc_google_cloud"]["project_id"]
  client_email node["rsc_google_cloud"]["client_email"]
  json_key node["rsc_google_cloud"]["json_key"] 
  timeout 600 #5 min
  
  action :assign
end
# fix compatibly issues with activesupport

#log 'Remove GCE supported ActiveSupport'
##remove rightscale unsupported installed by gce::default
#chef_gem "activesupport" do
#  action :remove
#end
#
#log 'Add Rightscale supported activesupport'
#chef_gem "activesupport" do
#  version '2.3.5' #rightscale supported
#  action :install
#end