#!/bin/bash

read -p "Enter login: " LOGIN
read -p "Enter password: " PASSWORD
read -p "Enter backup name: " BACKUP_NAME

ENDPOINT="https://webdav.yandex.ru/dump"

echo "Waiting..."

curl --progress-bar --verbose -o $BACKUP_NAME.tar.gz --user $LOGIN:$PASSWORD $ENDPOINT/$BACKUP_NAME.tar.gz  

sudo tar xzf $BACKUP_NAME.tar.gz --strip 1

rm ./$BACKUP_NAME.tar.gz

echo "Done"
