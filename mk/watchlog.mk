WATCH_DIR := mk/watch
LOG_FILE := log
WLG := $(WATCH_DIR)/$(LOG_FILE)

$(WLG):
	@mkdir -p $(WATCH_DIR)
	@touch $@
