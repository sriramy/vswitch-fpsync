##
## Make vswitch-fpsync, Netlink based synchronization
##
## Targets;
##  help		This printout
##  all (default)	Build all binaries
##  clean		Remove built files
##  install	Installs the executables
##

LIBDPDK_SRC=dpdk/*
FPSYNC_DIR=fpsync

all: fpsync

.PHONY: fpsync
fpsync:
	@echo "  fpsync"
	$(Q)meson setup $(FPSYNC_DIR)/build $(FPSYNC_DIR) $(P)
	$(Q)meson configure $(FPSYNC_DIR)/build $(P)
	$(Q)meson compile -C $(FPSYNC_DIR)/build $(P)

.PHONY: clean
clean:
	$(Q)ninja -C $(FPSYNC_DIR)/build -t clean $(P)
