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
VMBOX_URL = "file://D:/Vagrant/kubuntu14.04_x64.box"

#ENV['DEFAULT_VAGRANT_PROVIDER'] = 'vmware_workstation'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :dev_env do |dev_env|
    dev_env.vm.box = VMBOX
    dev_env.vm.box_url = VMBOX_URL
    dev_env.vm.provision :shell, path: "bootstrap_kubuntu.sh"
	dev_env.vm.provider "virtualbox" do |vb|
	  vb.memory = 4096
	  vb.gui = true
	end
	dev_env.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  end
end
