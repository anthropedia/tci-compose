compose=docker-compose -p tci

help:
	@echo "Shortcuts for project commands: run [<service>], rebuild <service>, destroy."

run:  # [<str>service]
	${compose} up -d $(service)

rebuild:  # <str>service
	${compose} stop $(service) && ${compose} rm -f $(service) && make run service=$(service)

destroy:
	${compose} down

deploy:
	ssh epidaurus 'cd ~/tci-compose && git pull && make run'
