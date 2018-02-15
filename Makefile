help:
	@echo "Shortcuts for project commands: run [<service>], rebuild <service>, deploy, destroy."

run:  # [<str>service]
	docker-compose up -d $(service)

rebuild:  # <str>service
	docker-compose stop $(service) && docker-compose rm -f $(service) && make run service=$(service)

destroy:
	docker-compose down

deploy:
	ssh epidaurus 'cd ~/tci-compose && git pull && make run'
