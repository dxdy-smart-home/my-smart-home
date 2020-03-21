Raspberry pi 4
=========

## Enable Wi-fi 5G

``` bash
sudo raspi-config
# Go to Localization Options and change WiFi County on US

sudo iwlist wlan0 scan | grep Freq
```

## Disable bluetooth

``` bash
sudo echo "dtoverlay=disable-bt" >> /boot/config.txt
sudo reboot
```

## Install docker on raspberry pi

``` bash
sudo apt update
sudo apt install -y python3-pip libffi-dev

curl -sSL https://get.docker.com | sh
sudo usermod -aG docker pi
sudo reboot

sudo pip3 install docker-compose
```
