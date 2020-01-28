.DEFAULT_GOAL := help

REQUIREMENTS=requirements.txt

FILES_TO_FORMAT_PYTHON=setup.py scripts src tests docs/source/conf.py

DOCS_DIR=$(PWD)/docs
LATEX_BUILD_DIR=$(DOCS_DIR)/build/latex
LATEX_BUILD_STATIC_DIR=$(LATEX_BUILD_DIR)/_static
LATEX_LOGO=$(DOCS_DIR)/source/_static/logo.png

VENV_DIR=$(PWD)/venv
PYTHON=$(VENV_DIR)/bin/python

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT

help:
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

.PHONY: clean-docs
clean-docs:  ## remove all the documentation build files
	rm -rf $(DOCS_DIR)/build

.PHONY: docs
docs:  ## make docs
	make $(DOCS_DIR)/build/html/index.html
	source $(VENV_DIR)/bin/activate; cd $(DOCS_DIR); make latexpdf
	echo "Pdf is in docs/build/latex/radware-docker.pdf "

# Have to run build twice to get stuff in right place
$(DOCS_DIR)/build/html/index.html: $(DOCS_DIR)/source/*.py $(DOCS_DIR)/source/_templates/*.html $(DOCS_DIR)/source/*.rst README.rst $(VENV_DIR)
	mkdir -p $(LATEX_BUILD_STATIC_DIR)
	cp $(LATEX_LOGO) $(LATEX_BUILD_STATIC_DIR)
	source $(VENV_DIR)/bin/activate; cd $(DOCS_DIR); make html

.PHONY: virtual-environment
virtual-environment:  $(VENV_DIR)  ## make virtual environment for development
$(VENV_DIR): $(REQUIREMENTS)
	[ -d $(VENV_DIR) ] || python3 -m venv $(VENV_DIR)
	$(VENV_DIR)/bin/pip install --upgrade pip
	$(VENV_DIR)/bin/pip install -Ur $(REQUIREMENTS)
	touch $(VENV_DIR)
