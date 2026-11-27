# Database migrations, Pick another service with SERVICE=auth , for example
SERVICE ?= wallet
DB_URL ?= postgres://payments:payments@localhost:5432/$(SERVICE)?sslmode=disable
MIGRATE := migrate -path db/$(SERVICE)/migrations -database "$(DB_URL)"

.PHONY: migrate-up migrate-down migrate-version migrate-new db-list

migrate-up:
	@$(MIGRATE) up

migrate-down:
	@$(MIGRATE) down 1

migrate-version:
	@$(MIGRATE) version

migrate-new:
	@test -n "$(name)" || (echo "usage: make migrate-new name=add_something" && exit 1)
	migrate create -ext sql -dir db/$(SERVICE)/migrations -seq $(name)

db-list:
	@docker compose exec -T postgres psql -U payments -d $(SERVICE) -c '\dt'
