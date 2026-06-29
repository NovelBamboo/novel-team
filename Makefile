.PHONY: repomix

BRANCH_NAME := $(shell git branch --show-current)
FOLDER := $(notdir $(abspath .))

repomix:
	@mkdir -p temp
	@npx repomix@latest --style markdown -o temp/$(FOLDER)-$(BRANCH_NAME).repo.md
	@open temp