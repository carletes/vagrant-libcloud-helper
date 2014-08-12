# vagrant-libcloud-helper

A [Vagrant](http://www.vagrantup.com/) plugin used by
[libcloud-vagrant](https://github.com/carletes/libcloud-vagrant) to help
setting up VirtualBox instances.

At the moment only VirtualBox instances are supported.

`vagrant-libcloud-helper` does the following to your VirtualBox Vagrant
boxes:

* Allocate all SATA ports of the first SATA interface, so that disks may be
  hot-plugged once the machine is up. If no SATA controller is found, one
  will be created.


## Installation

Like all Vagrant plugins:

```sh
vagrant plugin install vagrant-libcloud-helper
```

## Usage

If you want to use this plugin outside
[libcloud-vagrant](https://github.com/carletes/libcloud-vagrant), you just
need to enable the bits you want.

### Allocation of SATA ports

The following `Vagrantfile` snippet activates the allocation of all SATA
ports (A new SATA controller will be created if none is found):

```ruby
Vagrant.configure("2") do |config|

  if Vagrant.has_plugin?("vagrant-libcloud-helper")
    config.libcloud_helper.allocate_sata_ports = 30
  end

  # [..]
end
```
By default no SATA ports will be allocated.


## Compatibility

This plugin has been tested under 64-bit Linux with:

* Vagrant 1.6.3
* VirtualBox 4.3.14


## Credits

Most of the code here was taken from the
[vagrant-persistent-storage](https://github.com/kusnier/vagrant-persistent-storage]) plugin.


## Changes

### Version 0.0.2

* The config parameter `config.libcloud_helper.allocate_sata_ports` is now an
  integer, representing the number of SATA ports to allocate.


### Version 0.0.1

* Initial release.
