up:
	docker-compose up

restart:
	docker-compose down
	docker-compose build
	docker-compose up