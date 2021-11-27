#!/bin/bash

printf "Setting execution permissions\n"
# # Execution permissions
chmod +x ./prometheus.sh
chmod +x ./node.sh

printf "Install starting...\n"

# Install
printf "Installing prometheus\n"
./prometheus.sh
printf "Installing node exporter\n"
./node.sh