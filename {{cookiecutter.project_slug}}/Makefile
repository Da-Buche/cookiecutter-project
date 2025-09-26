## ===============================================================================================================
## This makefile is here to centralize project commands.
## It does not actually 'make' files.
##
## A. Buchet - June 2025
## ===============================================================================================================

# Determine the operating system
OS_NAME := $(shell uname -s)

## Define root
{{ cookiecutter.project_slug.upper() }}_ROOT := $(shell pwd)
export {{ cookiecutter.project_slug.upper() }}_ROOT


## =======================================================
## Help is actually parsing the current file to document
## available commands semi-automatically.
##
## It has to be the first target so it is run by default.
## =======================================================

## Find maximum target length
help: MAX_LEN := $(shell grep -Eo '^[a-zA-Z0-9_-]+:' $(MAKEFILE_LIST) | awk '{ if (length > max) max = length } END { print max }')

.PHONY: help
help: ## Display help and list available commands, but you probably figured that out...
	@echo "Available commands:"
	@echo
	@grep -E '^[a-zA-Z0-9_-]+:.*#' $(MAKEFILE_LIST) | sort | sed 's/:.*##* */:/g' | \
     env awk -F: '{printf "  \033[36m%-'$(MAX_LEN)'s\033[0m: %s\n", $$1, $$2}'
	@echo


## =======================================================
## Cleaning
## =======================================================

.PHONY: clean
clean: ## Remove all generated files.
	@rm -f .shellspec-quick.log


## =======================================================
## Install
## =======================================================

.PHONY: install
install: clean ## Install required tools & packages to make project work.
## Install uv using pip
	python -m venv .venv
	./.venv/bin/pip install --upgrade pip
	./.venv/bin/pip install uv
## Install shellspec
	#shellspec --version >/dev/null || (curl -fsSL https://git.io/shellspec | sh -s -- --yes)
## Install python dependencies
	uv sync


## =======================================================
## Testing
## =======================================================

.PHONY: test
test: ## Run previously failed tests until first failure.
	@shellspec --version >/dev/null || (>&2 echo 'Are you sure shellspec is installed and added to $$PATH?' && false)
	@env                                        \
    PATH="./.venv/bin:$$PATH"                   \
    EXAMPLE="$(filter-out $@, $(MAKECMDGOALS))" \
    bash -c 'shellspec --shell /bin/bash --color --quick --fail-fast -fd $${EXAMPLE:+--example }$$EXAMPLE $$SHELLSPEC_EXTRA_ARGS'


.PHONY: test_all
test_all: ## Run all tests.
	@rm -f .shellspec-quick.log
	@env                                    \
    SHELLSPEC_EXTRA_ARGS="--no-fail-fast" \
    bash -c 'make test $(filter-out $@, $(MAKECMDGOALS))'


## =======================================================
## Filter any other target
## (So `make test` can take arguments)
## =======================================================

%:
	@:

