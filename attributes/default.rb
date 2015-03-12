if node[:cloud][:provider]!='vagrant'
require '/var/spool/cloud/meta-data.rb'
end

default[:rsc_google_cloud][:project_id]=nil
default[:rsc_google_cloud][:instance_id]=nil
default[:rsc_google_cloud][:region]=nil
default[:rsc_google_cloud][:json_key]=nil
default[:rsc_google_cloud][:ip][:name]=nil

default["rsc_google_cloud"]["json_key"]= ""