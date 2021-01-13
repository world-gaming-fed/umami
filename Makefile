start-postgre:
	docker-compose -f docker-compose.dev.yml up

db-migrate:
	psql -h localhost -U umami -d umami -f sql/schema.postgresql.sql
	psql -h localhost -U umami -d umami -f sql/schema-update.postgresql.sql
