PROJECT_NAME := go-national-rail-client
GOLANGCI_LINT_VER := v1.55

.PHONY: tests
tests:
	@go test -v -cover -race -coverprofile=coverage.txt -covermode=atomic ./...

.PHONY: lint
lint:
	docker run \
		--rm \
		--volume "$$PWD":/src/github.com/matnich89/$(PROJECT_NAME) \
		--workdir /src/github.com/matnich89/$(PROJECT_NAME) \
		golangci/golangci-lint:$(GOLANGCI_LINT_VER) \
		/bin/bash -c "golangci-lint run -v --config=/src/github.com/matnich89/$(PROJECT_NAME)/.golangci.yml"
