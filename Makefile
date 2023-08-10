.PHONY: check setup
check:
	poetry --version
	pre-commit --version
	bash ./scripts/check.sh
setup:
	poetry config virtualenvs.in-project true
	poetry install
	poetry shell
	pre-commit install
	pre-commit run
