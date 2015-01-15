# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

#Vmware box information
#VMBOX = "trusty64_vmware"
#VMBOX_URL = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vmwarefusion.box"

#Virtualbox box information
#VMBOX = "trusty64_vb"
#VMBOX_URL = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box"

#Custom Kubuntu box information
VMBOX = "kubuntu-test"
#As of yet, there is no public url to specify for the custom kubuntu box
<<<<<<< HEAD
VMBOX_URL = "file://D:/Vagrant/kubuntu14.04_x64.box"
=======
VMBOX_INTERNAL_URL = "https://repo.i2rd.com/repo/kubuntu14.04_x64.box"
VMBOX_NET_URL = "https://UNKNOWN:UNKNOWN@repo.venturetech.net/repo/kubuntu14.04_x64.box"
>>>>>>> 1858caf... Removed public credentials from Vagrantfile

#ENV['DEFAULT_VAGRANT_PROVIDER'] = 'vmware_workstation'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :dev_environment do |dev_environment|
    dev_environment.vm.box = VMBOX
    dev_environment.vm.box_url = VMBOX_URL
    dev_environment.vm.provision :shell, path: "bootstrap_kubuntu.sh"
	dev_environment.vm.provider "virtualbox" do |vb|
	  vb.memory = 4096
	  vb.gui = true
	end
	dev_environment.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  end
  config.vm.synced_folder "D:/Workspaces/", "/opt/workspaces/shared"
end
