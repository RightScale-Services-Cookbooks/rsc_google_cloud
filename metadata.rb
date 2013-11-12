name             'rsc_google_cloud'
maintainer       'RightScale Inc'
maintainer_email 'premium@rightscale.com'
license          'Apache 2.0'
description      'Installs/Configures rsc_google_cloud'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "rightscale"
depends "google_cloud"

recipe "rsc_google_cloud::default", "set's up the rightscale google cloud environment"

attribute "rsc_google_cloud/instance_id",
  :display_namme => "RightScale Instance ID",
  :description => "RightScale Instance ID, should be set to Env:INSTANCE_ID",
  :optional => "required",
  :recipes => [ "rsc_google_cloud::default" ]
