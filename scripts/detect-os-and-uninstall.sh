#!/bin/bash

detect=$(cat /etc/*-release | grep 'ID=')
if [[ $detect == *"debian"* ]]; then
  export DEBIAN_FRONTEND=noninteractive
	sudo apt-get --assume-yes remove clamav
	rm -rf /var/log/clamav || true
        rm -rf /var/lib/clamav || true
	rm -rf /usr/share/clamav || true
elif [[ $detect == *"ubuntu"* ]]; then
  export DEBIAN_FRONTEND=noninteractive
	sudo apt-get --assume-yes remove clamav
	rm -rf /var/log/clamav || true
        rm -rf /var/lib/clamav || true
	rm -rf /usr/share/clamav || true
elif [[ $detect == *"centos"* ]]; then
    	sudo yum remove -y epel-release 
    	sudo yum remove -y clamav
	rm -rf /var/log/clamav || true
        rm -rf /var/lib/clamav || true
	rm -rf /usr/share/clamav || true
elif [[ $detect == *"alpine"* ]]; then
	sudo apk del clamav
	rm -rf /var/log/clamav || true
        rm -rf /var/lib/clamav || true
	rm -rf /usr/share/clamav || true
fi
