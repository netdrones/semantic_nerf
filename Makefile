# Makefile for Semantic NeRF
#
#
CONDA_NAME ?= $$(basename "$(PWD)")

.DEFAULT_GOAL := help
.PHONY: help
# https://swcarpentry.github.io/make-novice/08-self-doc/ is simpler just need
## help: available commands (the default)
help: $(MAKEFILE_LIST)
	@sed -n 's/^##//p' $(MAKEFILE_LIST)

## install: creates a conda environment
.PHONY: install
install: 
	if ! conda env list | grep -q "^$(CONDA_NAME)"; then \
		conda create -n "$(CONDA_NAME)" -y python=3.7 --file requirements.txt; fi && \
	conda run -n "$(CONDA_NAME)" pip install -r requirements.pip.txt
