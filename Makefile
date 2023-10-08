.PHONY: clone build run

clone:
	git clone https://github.com/FaztWeb/php-mysql-crud.git src

build:
	docker compose build

run: build
	docker compose up -d