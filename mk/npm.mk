NODE_MODULES_DIR := node_modules
NODE_CACHE_DIR := $$HOME/.node6-cache:/root/.npm
NODE_DOCKER_IMAGE := node:6.1-wheezy
NPM = $(WATCH_DIR)/$(NODE_MODULES_DIR)

$(NPM): $(WLG) package.json
	@docker run --rm \
		-v $(CURDIR):$(WORK_DIR) \
		-v $(NODE_CACHE_DIR) \
		-w $(WORK_DIR) \
		$(NODE_DOCKER_IMAGE) \
		npm install
	@touch $@
