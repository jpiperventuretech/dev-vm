# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'fileutils'
require 'csv'

# Defaults
$vmbox = "ubuntu/trusty64"         # The box to install
$ram = 4096                        # RAM in MB
$cpus = 2                          # Number of CPUs to emulate
$user = ENV["USERNAME"] || "dev"   # Name of the default user, and prefix for the name of the VM
$domain = "vipasuite.com"          # Domain name
$instances = [1]                   # List of instances to create (e.g. (1..5) to create five VMs)
$shared_folders = {}               # Map of folders on the host to share with the VMs

# MACs for static IPs
MAC_FILE = File.join(File.dirname(__FILE__), "vdm-hosts")
MACS = Hash[CSV.read(MAC_FILE).map { |row| [row[4], row[0].gsub!(":", "") ] }]

# Source config if it exists
CONFIG_FILE = File.join(File.dirname(__FILE__), "config.rb")
if File.exist?(CONFIG_FILE)
  require CONFIG_FILE
end

VAGRANTFILE_API_VERSION = 2

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Common settings
  config.vm.box = $vmbox

  # VirtualBox-specific settings
  config.vm.provider :virtualbox do |vb|
    vb.memory = $ram
    vb.cpus = $cpus
    vb.gui = true

    # Use paravirtualized NIC rather than emulating one
    (1..2).each do |i|
      vb.customize [ "modifyvm", :id, "--nictype%d" % i, "virtio" ]
    end
  end

  # Add shared folders
  $shared_folders.each do |(host,guest)|
    config.vm.synced_folder host.to_s, guest.to_s
  end

  # Define instances
  $instances.each do |i|
    config.vm.define name = "%s%d-vdm" % [$user, i] do |dev_environment|
      # Network
      fqdn = "%s.%s" % [name, $domain]
      config.vm.network :public_network, :mac => MACS[fqdn]
      dev_environment.vm.hostname = fqdn
      dev_environment.vm.provider :virtualbox do |vb|
        vb.name = name
      end

      #dev_environment.vm.provision :chef_apply do |chef|
        #chef.recipe = <<-EOF
          #package "kubuntu-desktop"
          #package "git"
        #EOF
      #end

      #dev_environment.vm.provision :shell, path: "bootstrap_kubuntu.sh"
      #dev_environment.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
    end
  end
end
