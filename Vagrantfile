Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.hostname = "rsc-google-cloud-berkshelf"

  # Every Vagrant virtual environment requires a box to build off of.   
  #config.vm.box = "opscode-ubuntu-12.04"
  config.vm.box = "opscode-ubuntu-14.04"
  #config.vm.box ="opscode-centos-6.6"
  #config.vm.box ="opscode-centos-7.0"
  #config.vm.box  ="opscode-debian-7.7"
  
  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  #config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-12.04_chef-provisionerless.boxx"
  #config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"
  #config.vm.box_url ="http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.6_chef-provisionerless.box"
  #config.vm.box_url="http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-7.0_chef-provisionerless.box"
  #config.vm.box_url="http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_debian-7.7_chef-provisionerless.box"
  
  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  config.vm.network :private_network, ip: "33.33.33.10", auto_config: false

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.

  # config.vm.network :public_network

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "~/vagrant", "/vagrant", disabled: true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # The path to the Berksfile to use with Vagrant Berkshelf
  # config.berkshelf.berksfile_path = "./Berksfile"

  # Enabling the Berkshelf plugin. To enable this globally, add this configuration
  # option to your ~/.vagrant.d/Vagrantfile file
  config.berkshelf.enabled = true

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to exclusively install and copy to Vagrant's shelf.
  # config.berkshelf.only = []

  config.omnibus.chef_version = '11.6.0'

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.except = []

  config.vm.provision :chef_solo do |chef|
    chef.log_level='info'
    chef.json = {
      :vagrant => {
        :box_name => 'google'
      },
       cloud:{
        provider: 'vagrant',
        public_ips: ['33.33.33.10'],
        private_ips: ['10.0.0.1']
      },
      rsc_google_cloud: {
          ip: {name: 'frontend-lb-01-prod'},
          instance_id:'i-12317e852',
          region:'us-central1',
          project_id:'hello-rightscale002',
          client_email:'559794233783-c7p9vaag3ih2v11v8o6rfpmf857qs0jq@developer.gserviceaccount.com',
          json_key: '{
  "private_key_id": "0e8761e45a0ad19ac1b39cc97a29a3a185fd9c4c",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAOhQNqMP8SKvZlBf\n80CRhVhsTcwieVlF8viYyjE2ecDhlj0RQLah/KOqxlCjoFwmnJJITCh+nlhC5/A8\n6sRApXned1714UvIfL2lz4BD5dEY5D1wtIS5HME5pEYcm+DKnTNdtHoP0Q1GLW0h\nZY8y+/WO9ZhTVyOsLm1Ku1k/BIVZAgMBAAECgYAbfVppwzoqe4zk1+XF7zJTO0Wd\ncTrgyHku142dcy/HFiqcAU2iDtsBVvTul94i6WK/oJR6ejksgoZFlD/Hh0rNPjuj\nHYhkmgcWvag+Q/zua/nvE/bDkQQ6zrlRc600UIm2NxBL/gaoapBRPsiDbfQfI0LR\nKp7/O8qLm78EMvTmDQJBAPsPB9rMHW5n56x5jrkuzgz3ASWQmG93QdHvgTR0pLwv\nM+F/G6q8EXiSjhveO+OKf0w8Is5qFq6a0erz0Xon5osCQQDs4rvAJ12cFJzGPDsE\nQTcboNA4ELFvtv/Ru7IXPP02ReXX1HrOf10DWwjG8qMVGDr11+oAHhOqbeUtUWs/\nl+QrAkEA0rKNnAF7ncHT+7rUnfN6+ASAUN9mHv4OHjsLy1MtQcW3m8LKHGLTosYU\nP60lw9Pi+77oUyVTvduu2qkfH47G+wJAG/6bk5TTYjupX2AE1XbjjVdO5CFM5tfo\nmZ+l50sk3YIbLIuGy9qPYnMisWhBT5/ib+VJWSQ0zMJaACYMF6LaqwJBAPnN3Eq8\nqElXaCMEA5onO5aOPBA8OWMxcXz2B4MgXJtmmbvMrCnmeWdPxoPsvvNl7XBKaD1S\nSl9mOQM1k9HI3IE\u003d\n-----END PRIVATE KEY-----\n",
  "client_email": "559794233783-c7p9vaag3ih2v11v8o6rfpmf857qs0jq@developer.gserviceaccount.com",
  "client_id": "559794233783-c7p9vaag3ih2v11v8o6rfpmf857qs0jq.apps.googleusercontent.com",
  "type": "service_account"
}'
      }
    }

    chef.run_list = [
       "recipe[apt::default]",
      #"recipe[yum-epel]",
      "recipe[rsc_google_cloud::ip_assign]",
    ]
  end
end