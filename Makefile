PROJECT_NAME := accord
APP_DIR := app
WORK_DIR := /data

help:
	@echo "\n USAGE:\n"
	@echo "  release"
	@echo "  clean"

include mk/watchlog.mk
include mk/npm.mk
include mk/docker.mk
include mk/helpers.mk

release: DCNAME := release
release: DCCMD := npm run release
release: $(NPM) docker_container clean_watchlogs

install: $(NPM)

clean:
	@$(MAKE) clean_dist --silent
	$(if $(ALL), @$(MAKE) clean_node_modules --silent)
	@$(MAKE) clean_watchlogs --silent

clean_dist: DCCMD := npm run clean:dist
clean_dist: $(NPM) docker_container

clean_watchlogs:
	-@rm -rf $(WATCH_DIR)

clean_watchlog_npm:
	@$(RM) $(WATCH_DIR)/$(NODE_MODULES_DIR)

clean_node_modules: DCCMD := rm -rf $(NODE_MODULES_DIR)
clean_node_modules: $(NPM) docker_container
