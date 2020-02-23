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


