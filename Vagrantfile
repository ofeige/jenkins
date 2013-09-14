Vagrant.configure("2") do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.synced_folder ".", "/var/www", :owner => "www-data", :group => "www-data"
  config.vm.network :forwarded_port, guest: 8080, host: 8080

  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    vb.gui = false
  
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end
  
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["vendor/chef/cookbooks", "vendor/chef/my_cookbooks"]
    chef.add_recipe "dotdeb"
    chef.add_recipe "dotdeb::php54"
    chef.add_recipe "git"
    chef.add_recipe "php"
    chef.add_recipe "phpcs::composer"
    chef.add_recipe "phpunit::composer"
    chef.add_recipe "phpcpd"
    chef.add_recipe "pdepend::composer"
    chef.add_recipe "phploc::composer"
    chef.add_recipe "phpmd::composer"
    chef.add_recipe "phpcb"
    chef.add_recipe "jenkins"
    chef.add_recipe "ant"

    chef.json = {
      :jenkins => {
        :server => {
          :host => "0.0.0.0",
          :plugins => [
            "checkstyle", "clover", "dry", "htmlpublisher", "jdepend", "plot", "pmd", "violations", "xunit", "git"
	        ]
        }
      },
      :pdepend => {
        :install_method => "composer",
        :version => "1.1.1"
      }
    }
  end
end
