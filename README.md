This is a basic Packer configuration which can be used to build Ubuntu 18.04 VM template remotely on Vmware vSphere. 

## Prerequisites
* [Packer](https://packer.io)
* [Packer Builder for VMware vSphere](https://github.com/jetbrains-infra/packer-builder-vsphere)
* [Ubuntu Server ISO](http://cdimage.ubuntu.com/releases/18.04.1/release/ubuntu-18.04.1-server-amd64.iso)
* vSphere vCenter accessible from your workstation
* DHCP server for VM template building

## Usage
* `cp vars.json.example vars.json`
* edit `vars.json` according to your environment
* run `packer build -var-file=vars.json ubuntu.json`

## Vmware customization issues fix
* Current version of open-vm-tools does not support `netplan` in VM customization. The following workaround is done in provisioning script:
    * ‘disable_vmware_customization: false’ is added to `/etc/cloud/cloud.cfg`
* `tmp` dir issue fix:
    * line `D /tmp 1777 root root -` is commented out from `/usr/lib/tmpfiles.d/tmp.conf`