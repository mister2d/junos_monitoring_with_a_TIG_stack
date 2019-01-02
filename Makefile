grafana-cli:
	@echo "======================================================================"
	@echo "start a shell session in the grafana container"
	@echo "======================================================================"
	docker exec -i -t grafana /bin/bash

telegraf-openconfig-cli:
	@echo "======================================================================"
	@echo "start a shell session in the telegraf container"
	@echo "======================================================================"
	docker exec -i -t telegraf-openconfig /bin/bash

influxb-cli:
	@echo "======================================================================"
	@echo "start a shell session in the influxb container"
	@echo "======================================================================"
	docker exec -it influxdb bash

restart: stop start

up:
	@echo "======================================================================"
	@echo "create docker networks, pull docker images, create and start docker containers"
	@echo "======================================================================"
	docker-compose -f ./docker-compose.yml up -d

down:
	@echo "======================================================================"
	@echo "stop docker containers, remove docker containers, remove docker networks"
	@echo "======================================================================"
	docker-compose -f ./docker-compose.yml down

start:
	@echo "======================================================================"
	@echo "Start docker containers"
	@echo "======================================================================"
	docker-compose -f ./docker-compose.yml start

stop:
	@echo "======================================================================"
	@echo "Stop docker containers"
	@echo "======================================================================"
	docker-compose -f ./docker-compose.yml stop