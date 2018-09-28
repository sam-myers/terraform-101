#!/usr/bin/env bash

wget https://releases.hashicorp.com/consul/${consul_version}/consul_${consul_version}_linux_amd64.zip
unzip -o consul_${consul_version}_linux_amd64.zip
rm consul_${consul_version}_linux_amd64.zip

systemctl daemon-reload
systemctl stop consul || true
mv consul /usr/local/bin/consul
systemctl start consul

sleep 3
# This will fail the install if Consul doesn't come up
consul members
