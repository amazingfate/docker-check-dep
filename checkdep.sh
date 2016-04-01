#!/bin/bash
source /docker-check-dep/params.env
apt-get update
apt-get -y install python python-apt coreutils python-pycurl
cd /docker-check-dep
python /docker-check-dep/get_sourcelist.py
rm /etc/apt/sources.list
mv base.list /etc/apt/sources.list.d/
apt-get -y update
python /docker-check-dep/AutoAPT.py -m cb -f
mv record.rd orig.list
mv rpa.list /etc/apt/sources.list.d/
apt-get -y update
python /docker-check-dep/AutoAPT.py -m cb -f
python /docker-check-dep/compare_result.py
