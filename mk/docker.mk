DCFLAGS := --rm
DCNAME :=
PROJECT_DIR := $(CURDIR)
DCWORK_DIR := $(WORK_DIR)
DCPORT :=
DCCMD :=

docker_container:
	@docker run $(DCFLAGS) \
		$(if $(filter $(DCNAME), $(DCNAME)), --name $(PROJECT_NAME)_$(DCNAME)) \
		-v $(PROJECT_DIR):$(WORK_DIR) \
		-v $(NODE_CACHE_DIR) \
		-w $(DCWORK_DIR) \
		$(if $(filter $(DCPORT), $(DCPORT)), -p $(DCPORT)) \
		$(NODE_DOCKER_IMAGE) \
		$(DCCMD)
