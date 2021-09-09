export
WORLD_PATH ?= $(HOME)/terraria
WORLD ?= default
PASSWORD ?= banana


.PHONY: create
create:
	docker-compose run --rm terraria --


.PHONY: start
start:
	docker-compose up -d terraria


.PHONY: stop
stop:
	docker-compose down


.PHONY: logs
logs:
	docker-compose logs -t -f terraria


.PHONY: clean
clean:
	docker-compose down --rmi all
