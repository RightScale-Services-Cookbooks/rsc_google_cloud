marker "recipe_start_rightscale" do
  template "rightscale_audit_entry.erb"
end


include_recipe 'rsc_google_cloud::default'

# assumes the static IP is already created in the google compute console
# supply the name of the static ip in the node["rsc_google_cloud"]["ip"]["name"] 
# attribute

gce_ip node["rsc_google_cloud"]["ip"]["name"] do
  name node["rsc_google_cloud"]["ip"]["name"]
  server node["rsc_google_cloud"]["instance_id"]
  region node["rsc_google_cloud"]["region"]
  project_id node["rsc_google_cloud"]["project_id"]
  client_email node["rsc_google_cloud"]["client_email"]
  json_key node["rsc_google_cloud"]["json_key"] 
  timeout 300 #5 min
  
  action :assign
end