#
# Cookbook Name:: rsc_google_cloud
# Recipe:: default
#
# Copyright 2013, RightScale Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
rightscale_marker :begin

log "google project id: #{node[:google_cloud][:project]}"
log "google instance id: #{node[:google_cloud][:instance_id]}"
log "google zone id: #{node[:google_cloud][:zone_id]}"

cookbook_file "/tmp/google-daemon.tar.gz" do
  source "google-daemon.tar.gz"
  owner "root"
  group "root"
  mode "0644"
  action :create
end

execute "tar -xvpzf /tmp/google-daemon.tar.gz -C /"

cookbook_file "/tmp/google-startup-scripts.tar.gz" do
  source "google-startup-scripts.tar.gz"
  owner "root"
  group "root"
  mode "0644"
  action :create
end

execute "tar -xvpzf /tmp/google-startup-scripts.tar.gz -C /"

include_recipe "google_cloud::default"

rightscale_marker :end
