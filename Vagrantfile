# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # This plugin must be explicitly enabled. Do it like this:
  config.libcloud_helper.allocate_sata_ports = true

  config.vm.define "precise64" do |n|
    n.vm.hostname = "precise64"
    n.vm.box = "hashicorp/precise64"
  end

  # Test on a non-Linux box. This one, for instance, has no SATA adapter.
  config.vm.define "openbsd55" do |n|
    n.vm.hostname = "openbsd55"
    n.vm.box = "tmatilai/openbsd-5.5"

    # This Vagrant box does not boot when the host is behind an HTTP/FTPs
    # proxy, beacuse Vagrant tries to install the OpenBSD package ``rsync``
    # in order to implement rsync shared folders, which are the default.
    # We disable them anyway, since we do not need them for this demo.
    n.vm.synced_folder ".", "/vagrant", disabled: true
  end
end
