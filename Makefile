
.PHONY: test test-race lint migrate-up-all migrate-up migrate-create migrate-down

test:
	go test ./... -count=1

test-race:
	go test ./... -race -count=1

lint:
	golangci-lint run

fmt:
	golangci-lint run --fix

migrate-create: ## make migrate-create service=core name=migration_name
	migrate create -ext sql -dir services/$(service)/migrations -seq $(name)


