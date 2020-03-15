Raspberry pi 4
=========

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
