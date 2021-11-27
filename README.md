# Laravel Forge Prometheus & Node Exporter recipe

This is a complete recipe to install prometheus and node exporter to laravel forge instances.

**Note:** You run this script at your own risk, while this script works perfectly for me it does not mean it is a silver bullet. Please ensure you know what will be installed before executing.

## Services installed:
- Prometheus
- Node exporter

**NOTE:** This will not install the grafana dashboard, it will only install services to collect metrics to be imported elsewhere.

## Ports exposed
- 9090
- 9100

## Usage
1. [Create a new recipe](https://forge.laravel.com/docs/1.0/servers/recipes.html#creating-recipes) in Laravel Forge
2. Add the following code as the recipe to execute.
```BASH
#!/bin/bash

git clone https://github.com/vaugenwake/forge-prometheus-recipes.git forge-prometheus-recipes
cd forge-prometheus-recipes
./install.sh
# Optional, will delete install files from server when install completes
# Will delete even if install is unsuccessful
cd ../
rm -rf ./forge-prometheus-recipes
```

## Explore metrics
- Prometheus: http://your-server:9090/metrics
- Node Exporter: http://your-server:9100/metrics

## Connect to grafana
1. Login to your grafana dashboard
2. Go to: configuration > datasources
3. Click "Add data source"
4. Select "Prometheus"
5. Complete the form with your server details
6. Click "Save and Test"
7. Connect your new datasource to a dashboard or create a new one.
