#!/usr/bin/env make -f
SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --no-builtin-rules
MAKEFLAGS += --silent

.DEFAULT_GOAL := help
help: Makefile
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'


# =====================================================================================================================
# Common
# =====================================================================================================================
init:  ## Initialize project repository
	pre-commit autoupdate
	pre-commit install --install-hooks --hook-type pre-commit --hook-type commit-msg
.PHONY: init


# =============================================================================
# CI
# =============================================================================
ci: lint test scan  ## Run all CI tasks
.PHONY: ci

format:  ## Run autoformatters

.PHONY: format

lint:  ## Run all linters

.PHONY: lint

test:  ## Run tests

.PHONY: test

scan:  ## Run scans

.PHONY: scan


# =============================================================================
# Handy Scripts
# =============================================================================
clean:  ## Remove temporary files
.PHONY: clean
