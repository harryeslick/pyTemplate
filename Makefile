VENV := .venv/bin
export QUARTO_PYTHON := $(CURDIR)/.venv/bin/python

.PHONY: notebooks api-docs docs preview clean test-contracts

## Convert .py percent-format notebooks to .ipynb for rendering
notebooks:
	find notebooks -name "*.py" -not -path "*/archive/*" -not -path "*/old/*" \
		-exec $(VENV)/jupytext --to ipynb {} \;

## Build quartodoc API reference pages
api-docs:
	$(VENV)/quartodoc build

## Full site build
docs: notebooks api-docs
	quarto render

## Live preview with auto-reload
preview: notebooks api-docs
	quarto preview

## Run contract notebook tests (executes .py notebooks directly via conftest.py)
test-contracts:
	$(VENV)/pytest notebooks/contracts/ --ignore=notebooks/contracts/slow/ -v

## Remove all generated artifacts
clean:
	rm -rf _site _freeze .quarto
	find notebooks -name "*.ipynb" -not -path "*/archive/*" -not -path "*/slow/*" -delete
	rm -rf docs/reference
