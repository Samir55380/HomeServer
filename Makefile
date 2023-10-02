# Define the name of the directory to search for Docker Compose files
SEARCH_DIR := .

# Check if docker-compose is installed, otherwise use docker compose
DOCKER_COMPOSE := $(shell command -v docker-compose 2> /dev/null || command -v docker\ compose 2> /dev/null)

# Find all subdirectories in the current directory
SUBDIRS := $(wildcard $(SEARCH_DIR)/*)

.PHONY: all

all: run

run:
	@for dir in $(SUBDIRS); do \
		if [ -d "$$dir" ]; then \
			if [ -f "$$dir/docker-compose.yml" ]; then \
				echo "Running docker-compose in $$dir"; \
				(cd "$$dir" && $(DOCKER_COMPOSE) down); \
				(cd "$$dir" && $(DOCKER_COMPOSE) up --build -d); \
			else \
				echo "No docker-compose.yml found in $$dir"; \
			fi; \
		fi; \
	done
