#!/usr/bin/env bash

wget https://releases.hashicorp.com/nomad/${nomad_version}/nomad_${nomad_version}_linux_amd64.zip
unzip nomad_${nomad_version}_linux_amd64.zip
rm nomad_${nomad_version}_linux_amd64.zip

mkdir -p /opt/nomad/ || true
mkdir -p /etc/nomad/ || true

systemctl daemon-reload
systemctl stop nomad || true
mv nomad /usr/local/bin/
systemctl start nomad

sleep 3
# This will fail the install if Nomad doesn't come up
nomad status
