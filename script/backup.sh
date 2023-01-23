#!/bin/bash

set -e

ENDPOINT="https://webdav.yandex.ru/dump"
BACKUP_NAME=my_smart_home_$(date +"%Y%m%d_%H%M%S")

echo "Waiting..."

mkdir -p $BACKUP_NAME/{duckdns,homeassistant/config,zigbee2mqtt/data,certbot,mqtt}

sudo cp homeassistant/config/secrets.yaml $BACKUP_NAME/homeassistant/config/secrets.yaml
sudo cp homeassistant/config/html5_push_registrations.conf $BACKUP_NAME/homeassistant/config/html5_push_registrations.conf
sudo cp homeassistant/config/known_devices.yaml $BACKUP_NAME/homeassistant/config/known_devices.yaml
sudo cp -r homeassistant/config/.storage/ $BACKUP_NAME/homeassistant/config/.storage/

sudo cp zigbee2mqtt/data/configuration.yaml $BACKUP_NAME/zigbee2mqtt/data/configuration.yaml
sudo cp zigbee2mqtt/data/state.json $BACKUP_NAME/zigbee2mqtt/data/state.json
sudo cp zigbee2mqtt/data/database.db $BACKUP_NAME/zigbee2mqtt/data/database.db

sudo cp -r mqtt/ssl/ $BACKUP_NAME/mqtt/ssl/

sudo tar czf $BACKUP_NAME.tar.gz $BACKUP_NAME

sudo rm -rf ./$BACKUP_NAME
curl --progress-bar -o /dev/stdout --verbose -T $BACKUP_NAME.tar.gz --header "Authorization: OAuth $OAUTH_YANDEX_API_KEY" $ENDPOINT/$BACKUP_NAME.tar.gz
sudo rm ./$BACKUP_NAME.tar.gz

echo "Done"
