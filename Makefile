help:
	@echo "Shortcuts for project commands: run [<service>], rebuild <service>, destroy."

run:  # [<str>service]
	docker-compose -p tci up -d $(service)

rebuild:  # <str>service
	docker-compose stop $(service) && docker-compose rm -f $(service) && make run service=$(service)

destroy:
	docker-compose -p tci down
