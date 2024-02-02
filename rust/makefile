.DEFAULT_GOAL := help
PROJECTNAME=$(shell basename "$(PWD)")
# ##############################################################################
# # GENERAL
# ##############################################################################
VERSION="0.1.2"
.PHONY: help
help: makefile
	@echo
	@echo " Available actions in "$(PROJECTNAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo

## init: Install missing dependencies.
init:
	cargo install flutter_rust_bridge_codegen
	cargo install cargo-ndk
	@if [ $$(uname) == "Darwin" ] ; then cargo install cargo-lipo ; fi
## :

## all: Compile iOS, Android and bindings targets
all: init jnilib xcframework linux
 
linux:
	  @echo "[Creating linux binary ...] $@"
	  docker run --platform linux/x86_64 --name bwcbuilder01 -v $(shell pwd):/boltz-dart bwcbuilder && docker stop bwcbuilder01 && docker rm bwcbuilder01
	  @echo "[Done ✅]"

jnilib:
	  @echo "[Creating android jniLibs ...] $@"
	  sh android.sh $(VERSION)
	  @echo "[Done ✅]"

xcframework:
	  @echo "[Creating rust_bdk_ffi.xcframework ...] $@"
	  sh darwin.sh $(VERSION)
	  @echo "[Done ✅]"

# compress-build:
# 	@echo "[COMPRESSING BINARIES TO FLUTTER PACKAGE ...] $@"
# 	sh compress.sh
# 	@echo "[Done ✅]"

# copy-build:
# 	@echo "[COPYING BINARIES TO FLUTTER PACKAGE ...] $@"
# 	sh copy.sh
# 	@echo "[Done ✅]"







