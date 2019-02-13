#!/bin/bash -eux
# Tell vmware tools to use cloud-init
echo "disable_vmware_customization: false" >> /etc/cloud/cloud.cfg
# Fix tmp dir issue
sed -i '/D\ \/tmp\ 1777\ root\ root\ -/s/^/#/g' /usr/lib/tmpfiles.d/tmp.conf
