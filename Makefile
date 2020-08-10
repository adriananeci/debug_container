.PHONY: help default build push test clean

NAME ?= aaneci/debug
REGISTRY ?= docker.io
COMMIT ?= $(shell git rev-parse --short HEAD)

default: help

help: ## Print this help text
	@printf "\n"
	@awk 'BEGIN {FS = ":.*?## "}; ($$2 && !/@awk/){printf "${CYAN}%-30s${NC} %s\n", $$1, $$2}' $(lastword ${MAKEFILE_LIST}) | sort
	@printf "\n"

# BUILD & PUSH
# -----------

build: ## Builds the local Docker container for development
	docker build -t ${NAME}:$(COMMIT) .
	docker tag ${NAME}:$(COMMIT) ${NAME}:latest

push: build ## Push Docker image to $(REGISTRY)
	docker tag ${NAME}:$(COMMIT) $(REGISTRY)/${NAME}:$(COMMIT)
	docker push $(REGISTRY)/${NAME}:$(COMMIT)

	docker tag ${NAME}:latest $(REGISTRY)/${NAME}:latest
	docker push $(REGISTRY)/${NAME}:latest

# TEST
# -----------

test: build ## Test docker image in a kind cluster
	docker run -it --rm --name debug_container ${NAME}:latest bash

# CLEANUP
# -----------
clean:
	docker rm -f debug_container
	docker rmi --force ${NAME}:$(COMMIT) ${NAME}:latest