#!/usr/bin/env bash

apt update
apt dist-upgrade
apt install qemu-guest-agent
apt install cloud-init


qm create 901
qm importdisk 901 ~/images/debian-11-generic-amd64.raw fast1
