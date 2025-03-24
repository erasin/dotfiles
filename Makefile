# Default target when `make` is run without arguments.
.DEFAULT_GOAL := help
width=10

# Generate a list of available commands and their descriptions by parsing the Makefile.
help:
	@echo "命令:"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%${width}s\033[0m: %s\n", $$1, $$2}'
	@echo ""

install: ## 创建 link 
	bash ./install.sh

uninstall: ## 清理 link

# Special targets that are not files:
.PHONY: help
