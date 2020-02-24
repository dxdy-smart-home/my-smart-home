up:
	docker-compose up -d
 
down:
	docker-compose down

logs:
	docker-compose logs

show_certificates:
	docker-compose exec nginx_certbot certbot certificates

create_certificate:
	docker-compose exec nginx_certbot certbot --renew-by-default --nginx --deploy-hook "nginx -s reload"

test_renewal_certificates:
	docker-compose exec nginx_certbot certbot renew --dry-run

set_headphones:
	docker-compose exec mpd amixer cset numid=3 1

test_headphones:
	docker-compose exec mpd aplay /usr/share/sounds/alsa/Front_Center.wav

set_default_playlist:
	docker-compose exec mpd /bin/bash -c "mpc clear | ls /mpd/playlists/*.m3u | xargs cat | xargs mpc insert"

check_hass:
	docker-compose exec homeassistant /bin/bash -c "hass -c /config --script check_config"

restart_hass:
	docker-compose restart homeassistant
