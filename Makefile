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

setup-macos:
	@echo $$GITLAB_HOME
	@sudo mkdir -p $$GITLAB_HOME
	@sudo chown $$USER $$GITLAB_HOME
	@sudo chmod 755 $$GITLAB_HOME

run-macos:
	@docker-compose -f docker-compose-arm.yml up -d
run:
	@docker-compose -f docker-compose.yml up -d

gitlab-pass:
	@sudo docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password