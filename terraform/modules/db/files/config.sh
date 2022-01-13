#!/bin/bash
set -e
sleep 30
sudo mv -f /tmp/mongod.conf /etc/mongod.conf
sudo systemctl restart mongod
