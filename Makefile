VENV = venv
PYTHON = $(VENV)/bin/python
PIP = $(VENV)/bin/pip

.PHONY: run clean

run:	$(VENV)/bin/activate
	$(PYTHON) app.py


$(VENV)/bin/activate:	requirements.txt
	python -m venv $(VENV)
	$(PIP) install -r requirements.txt


clean:
	rm -rf __pycache__
	rm -rf $(VENV)