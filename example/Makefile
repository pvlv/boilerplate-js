PROJECT_NAME := accord_example
APP_DIR := app
WORK_DIR := /data
EXAMPLE_DIR := plugin
CONTAINER_PORT := 7121
LOCAL_PORT := 7121

help:
	@echo "\n USAGE:\n"
	@echo "  start"
	@echo "  stop"
	@echo "  clean"

include ../mk/watchlog.mk
include ../mk/npm.mk
include ../mk/docker.mk
include ./mk/helpers.mk

install: $(NPM)

start: DCNAME := start
start: DCFLAGS := --rm -it
start: PROJECT_DIR := $(CURDIR)/..
start: DCWORK_DIR := $(WORK_DIR)/$(EXAMPLE_DIR)
start: DCPORT := $(LOCAL_PORT):$(CONTAINER_PORT)
start: DCCMD := npm run start
start: $(NPM) docker_container

stop:
	@docker rm -fv $(PROJECT_NAME)_start

clean:
	@$(MAKE) clean_js --silent
	$(if $(ALL), @$(MAKE) clean_node_modules --silent)
	@$(MAKE) clean_watchlogs --silent

clean_js: DCCMD := npm run clean
clean_js: $(NPM) docker_container

clean_watchlogs:
	-@rm -rf $(WATCH_DIR)

clean_node_modules: DCCMD := rm -rf $(NODE_MODULES_DIR)
clean_node_modules: $(NPM) docker_container
