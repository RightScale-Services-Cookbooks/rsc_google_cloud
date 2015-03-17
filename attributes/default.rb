if node[:cloud][:provider]!='vagrant'
require '/var/spool/cloud/meta-data.rb'
end

default[:rsc_google_cloud][:project_id]=nil
default[:rsc_google_cloud][:instance_id]=node[:rsc_google_cloud][:instance_id].split('/').last
default[:rsc_google_cloud][:region]=node[:rsc_google_cloud][:region].split('/').last
default[:rsc_google_cloud][:json_key]=nil
default[:rsc_google_cloud][:ip][:name]=nil