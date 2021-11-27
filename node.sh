#!/bin/bash

# Make node_exporter user
sudo adduser --no-create-home --disabled-login --shell /bin/false --gecos "Node Exporter User" node_exporter

# Download node_exporter and copy utilities to where they should be in the filesystem
#VERSION=0.16.0
VERSION=$(curl https://raw.githubusercontent.com/prometheus/node_exporter/master/VERSION)
wget https://github.com/prometheus/node_exporter/releases/download/v${VERSION}/node_exporter-${VERSION}.linux-amd64.tar.gz
tar xvzf node_exporter-${VERSION}.linux-amd64.tar.gz

sudo cp node_exporter-${VERSION}.linux-amd64/node_exporter /usr/local/bin/
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

# Download systemd service config
mkdir node
cd ./node
wget https://raw.githubusercontent.com/vaugenwake/forge-prometheus-recipes/main/node-exporter/node_exporter.service
cd ../

# config firewall
printf "Exposing port :9100...\n"
sudo ufw allow in 9100

# systemd
cat ./node/node_exporter.service | sudo tee /etc/systemd/system/node_exporter.service

printf "Starting node exporter service...\n"
sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter

# Installation cleanup
printf "Cleaning up node exporter install...\n"
rm node_exporter-${VERSION}.linux-amd64.tar.gz
rm -rf node_exporter-${VERSION}.linux-amd64
rm -rf ./node