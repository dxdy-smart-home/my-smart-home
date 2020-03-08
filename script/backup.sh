#!/bin/bash

read -p "Enter login: " LOGIN
read -p "Enter password: " PASSWORD

ENDPOINT="https://webdav.yandex.ru/dump"
BACKUP_NAME=my_smart_home_$(date +"%Y%m%d_%H%M%S")

echo "Waiting..."

mkdir -p $BACKUP_NAME/{duckdns,homeassistant/config,zigbee2mqtt/data,certbot}

sudo cp duckdns/.env $BACKUP_NAME/duckdns/.env

sudo cp homeassistant/config/secrets.yaml $BACKUP_NAME/homeassistant/config/secrets.yaml
sudo cp homeassistant/config/html5_push_registrations.conf $BACKUP_NAME/homeassistant/config/html5_push_registrations.conf
sudo cp homeassistant/config/known_devices.yaml $BACKUP_NAME/homeassistant/config/known_devices.yaml
#sudo cp homeassistant/config/home-assistant_v2.db $BACKUP_NAME/homeassistant/config/home-assistant_v2.db
sudo cp -r homeassistant/config/.storage/ $BACKUP_NAME/homeassistant/config/.storage/

sudo cp zigbee2mqtt/data/configuration.yaml $BACKUP_NAME/zigbee2mqtt/data/configuration.yaml

sudo cp -r certbot/letsencrypt/ $BACKUP_NAME/certbot/letsencrypt/

sudo tar czf $BACKUP_NAME.tar.gz $BACKUP_NAME

sudo rm -rf ./$BACKUP_NAME
curl -T $BACKUP_NAME.tar.gz --user $LOGIN:$PASSWORD $ENDPOINT/$BACKUP_NAME.tar.gz
sudo rm ./$BACKUP_NAME.tar.gz

echo "Done"
