up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs

show_certificates:
	docker compose exec nginx_certbot certbot certificates

create_certificate:
	docker compose exec nginx_certbot certbot --renew-by-default --nginx --deploy-hook "nginx -s reload"

test_renewal_certificates:
	docker compose exec nginx_certbot certbot renew --dry-run

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
