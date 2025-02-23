#!/bin/bash

set -e

ENDPOINT="/mnt/yandex.disk/dxdy/ha/dump/"
BACKUP_NAME=my_smart_home_$(date +"%Y%m%d_%H%M%S")

echo "Waiting..."

mkdir -p $BACKUP_NAME/{homeassistant/config,zigbee2mqtt/data,certbot,mqtt,syncthing/Sync}

sudo cp homeassistant/config/secrets.yaml $BACKUP_NAME/homeassistant/config/secrets.yaml
sudo cp homeassistant/config/html5_push_registrations.conf $BACKUP_NAME/homeassistant/config/html5_push_registrations.conf
sudo cp homeassistant/config/known_devices.yaml $BACKUP_NAME/homeassistant/config/known_devices.yaml
sudo cp -r homeassistant/config/.storage/ $BACKUP_NAME/homeassistant/config/.storage/

sudo cp zigbee2mqtt/data/configuration.yaml $BACKUP_NAME/zigbee2mqtt/data/configuration.yaml
sudo cp zigbee2mqtt/data/state.json $BACKUP_NAME/zigbee2mqtt/data/state.json
sudo cp zigbee2mqtt/data/database.db $BACKUP_NAME/zigbee2mqtt/data/database.db

sudo cp -r mqtt/ssl/ $BACKUP_NAME/mqtt/ssl/

sudo cp -r syncthing/Sync/db $BACKUP_NAME/syncthing/

sudo tar czf $BACKUP_NAME.tar.gz $BACKUP_NAME

sudo rm -rf ./$BACKUP_NAME
sudo cp $BACKUP_NAME.tar.gz $ENDPOINT
sudo rm ./$BACKUP_NAME.tar.gz

echo "Done"
