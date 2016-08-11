npm\:%:
	@docker run --rm -it \
		--name $(PROJECT_NAME)_npm_command \
		-v $(CURDIR):$(WORK_DIR) \
		-v $(NODE_CACHE_DIR) \
		-w $(WORK_DIR) \
		$(NODE_DOCKER_IMAGE) \
		sh -c "trap exit TERM;npm $(subst npm:,,$@)"

gulp\:%: $(NPM)
	@docker run --rm -it \
		--name $(PROJECT_NAME)_gulp_task \
		-v $(CURDIR):$(WORK_DIR) \
		-v $(NODE_CACHE_DIR) \
		-w $(WORK_DIR) \
		$(NODE_DOCKER_IMAGE) \
		sh -c "trap exit TERM;./node_modules/.bin/gulp $(subst gulp:,,$@)"

in: DCFLAGS := --rm -it
in: DCNAME := in
in: DCCMD := bash
in: docker_container