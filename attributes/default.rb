default[:google_cloud][:project]=node[:rsc_google_cloud][:instance_id].split('/')[1]
default[:google_cloud][:instance_id]=node[:rsc_google_cloud][:instance_id].split('/').last
default[:google_cloud][:zone_id]=node[:rsc_google_cloud][:datacenter].split('/').last
