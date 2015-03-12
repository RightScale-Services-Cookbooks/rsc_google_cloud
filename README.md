rsc_google_cloud Cookbook
=========================
Manages Google Compute Engine Resources


Requirements
------------
You need access to the Google Compute Engine Console and Access to the API credentials.
https://console.developers.google.com/project?authuser=0

Depends on gce cookbook: https://github.com/RightScale-Services-Cookbooks/google-compute-engine


Attributes
----------
*  node["rsc_google_cloud"]["ip"]["name"] - name of the static IP from the google console
*  node["rsc_google_cloud"]["instance_id"] - name of the server to update. use ENV:INSTANCE
*  node["rsc_google_cloud"]["region"] - Google Clould regiond.  use ENV:DATACENTER
*  node["rsc_google_cloud"]["project_id"] - Google API project name
*  node["rsc_google_cloud"]["client_email"] - Google API client email 
*  node["rsc_google_cloud"]["json_key"]  - Google API JSON key

Usage
-----
#### rsc_google_cloud::default
Include do_assign_static_ip recipe early in your runlist.  

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
