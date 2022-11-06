compose:
	docker compose up -d --build --remove-orphans

ssh:
	docker compose exec app /bin/sh

root:
	docker compose exec -u root app /bin/sh
