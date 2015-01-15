# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

#Custom Kubuntu box information
VMBOX = "kubuntu14.04_x64"

PUBLIC_REPO_USERNAME = "UNKNOWN"
PUBLIC_REPO_PASSWORD = "UNKNOWN"

#As of yet, there is no public url to specify for the custom kubuntu box
VMBOX_INTERNAL_URL = "https://repo.i2rd.com/repo/kubuntu14.04_x64.box"
VMBOX_PUBLIC_URL = "https://" + PUBLIC_REPO_USERNAME + ":" + PUBLIC_REPO_PASSWORD + "@repo.venturetech.net/repo/kubuntu14.04_x64.box"

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
