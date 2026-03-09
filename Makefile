up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs

check_hass:
	docker compose exec homeassistant /bin/bash -c "hass -c /config --script check_config"

restart_hass:
	docker compose restart homeassistant

backup:
	./script/backup.sh

restore:
	./script/restore.sh

ble_restart:
	sudo hciconfig hci0 up

usbId:
	ls -l /dev/serial/by-id
