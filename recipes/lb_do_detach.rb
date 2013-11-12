google_cloud_lb "detach" do
  service_lb_name node[:google_cloud][:lb][:pool_name]
  action :detach
end
