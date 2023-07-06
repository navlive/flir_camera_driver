#!/bin/bash

interface=$1

echo "Setting up network"
# sudo /opt/spinnaker/bin/gev_nettweak $interface
sudo sysctl -w net.ipv4.conf.all.rp_filter=0 && sudo sysctl -w net.ipv4.conf.$interface.rp_filter=0
sudo sysctl -w net.core.rmem_max=10485760 && sudo sysctl -w net.core.rmem_default=10485760
sudo ifconfig $interface mtu 9000

#cd flir_camera_driver
# source: http://wiki.ros.org/rc_genicam_api
echo "Running checks\ni"
eval ./net_perf_check.sh -i $interface
