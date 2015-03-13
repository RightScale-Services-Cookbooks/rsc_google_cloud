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

marker "recipe_start_rightscale" do
  template "rightscale_audit_entry.erb"
end

#update rubygems and the source to allow installing the correct
#version of fog
chef_gem 'rubygems-update'

case node[:platform_family]
when 'debian'
  %w{zlib1g-dev build-essential}.each do |pkg| 
    p = package pkg do 
      action :nothing 
    end 
    p.run_action(:install) 
  end
when 'rhel'
  %w{gcc ruby-devel zlib-devel}.each do |pkg| 
    p = package pkg do 
      action :nothing 
    end 
    p.run_action(:install) 
  end
end
include_recipe "gce::default" 

#remove rightscale incompatible gem
chef_gem "activesupport" do
  action :remove
end

chef_gem "activesupport" do
  version '2.3.5' #rightscale supported
  action :install
end

log "google project_id: #{node[:rsc_google_cloud][:project_id]}"
log "google instance_id: #{node[:rsc_google_cloud][:instance_id]}"
log "google region: #{node[:rsc_google_cloud][:region]}"
