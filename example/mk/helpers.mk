in: DCNAME := in
in: DCFLAGS := --rm -it
in: PROJECT_DIR := $(CURDIR)/..
in: DCWORK_DIR := $(WORK_DIR)/$(EXAMPLE_DIR)
in: DCPORT := $(LOCAL_PORT):$(CONTAINER_PORT)
in: DCCMD := bash
in: docker_container
