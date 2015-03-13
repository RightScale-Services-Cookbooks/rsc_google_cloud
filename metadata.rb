name             'rsc_google_cloud'
maintainer       'RightScale Inc'
maintainer_email 'premium@rightscale.com'
license          'Apache 2.0'
description      'Installs/Configures rsc_google_cloud'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.2.1'

depends "marker"
depends "gce"

recipe "rsc_google_cloud::default", "set's up the rightscale google cloud environment"
recipe "rsc_google_cloud::ip_assign", "Assigns static ip to an instance."
recipe "rsc_google_cloud::lb_do_attach", "attaches from RightScale to gce-lb"
recipe "rsc_google_cloud::lb_do_detach", "detaches from RightScale to gce-lb"

attribute "rsc_google_cloud/instance_id",
  :display_namme => "RightScale Instance ID",
  :description => "RightScale Instance ID, should be set to Env:INSTANCE_ID",
  :required => "required",
  :recipes => [ "rsc_google_cloud::default" ]

attribute "rsc_google_cloud/lb/pool_name",
  :display_name => "Google LB Pool Name",
  :description => "Google LB Pool Name",
  :required => "required",
  :recipes => [ "rsc_google_cloud::lb_do_attach", "rsc_google_cloud::lb_do_detach" ]

attribute "rsc_google_cloud/lb/tag",
  :display_name => "Google LB Firewall Tag",
  :description => "Google LB Firewall Tag",
  :required => "optional",
  :default => "www"

attribute "rsc_google_cloud/lb/ip",
  :display_name => "Google LB IP",
  :description => "Google Cloud Static IP",
  :required => "required"

attribute "rsc_google_cloud/ip/name",
  :display_name => "Google Static IP Name",
  :description => "The name of the Static IP from the Google Compute Console. Compute/Compute Engine/Networks",
  :required => "required",
  :recipes => [ "rsc_google_cloud::default" ]

attribute "rsc_google_cloud/project_id",
  :display_name => "Google API Project ID",
  :description => "Google API Project ID",
  :required => "required",
  :recipes => [ "rsc_google_cloud::default" ]

attribute "rsc_google_cloud/client_email",
  :display_name => "Google API Client Email",
  :description => "Google API Project Client Email",
  :required => "required",
  :recipes => [ "rsc_google_cloud::default" ]

attribute "rsc_google_cloud/json_key",
  :display_name => "Google API JSON key",
  :description => "Google API Project JSON Key from API Credentials. example: cred:google_json_key",
  :required => "required",
  :recipes => [ "rsc_google_cloud::default" ]

attribute "rsc_google_cloud/region",
  :display_name => "Google Region",
  :description => "Google Region env:datacenter",
  :required => "required",
  :recipes => [ "rsc_google_cloud::default" ]




