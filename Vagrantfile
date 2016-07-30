'''
/**
 * Boxer factoring
 *
 * Vagrantfile for buid vagrant boxes
 * @author Adriano Vieira <adriano.svieira at gmail.com>
 * @license @see LICENCE
 */
 '''

BOXER_HOSTNAME = (ENV.key?('BOXER_HOSTNAME') ? ENV['BOXER_HOSTNAME'] : "boxer-localhost").downcase

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "adrianovieira/centos7-vbox5024"
  config.vm.box_check_update = false
  config.vm.synced_folder ".", "/home/vagrant/sync", type: "rsync"

  config.vm.provision "housekeeper-bootstrap", type: "shell", path: "centos7/housekeeper-bootstrap.sh"
  config.vm.provision "housekeeper-hostname", type: "shell",
                      path: "centos7/housekeeper-hostname.sh",
                      args: ["#{BOXER_HOSTNAME}"]
  # what do you want on your box?

  # end

  config.vm.provision "housekeeper-cleanup", type: "shell", path: "centos7/housekeeper-cleanup.sh"

end # end-of-file
