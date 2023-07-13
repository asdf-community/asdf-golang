SRCFILES = $(shell git ls-files "bin/**" "lib/**" "spec/**" "test-fixtures/*.sh")
SHFMT_BASE_FLAGS = -s -i 2 -ci

format:
	shfmt -w $(SHFMT_BASE_FLAGS) $(SRCFILES)
.PHONY: format

format-check:
	shfmt -d $(SHFMT_BASE_FLAGS) $(SRCFILES)
.PHONY: format-check

lint:
	shellcheck -x $(SRCFILES)
.PHONY: lint
