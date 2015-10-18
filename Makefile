# Makefile for docker-registry

# docker settings
ENVS =
PORTS = -p 5000:5000
CONTAINER = registry


.PHONY: container run

container :
	docker build -t $(CONTAINER) .

run :
	docker run --restart=always --name $(CONTAINER) -i -d $(PORTS) $(ENVS) $(VOLUMES) -t $(CONTAINER)
stop :
	docker stop $(CONTAINER)
	docker rm $(CONTAINER)
kill :
	docker kill $(CONTAINER)
	docker rm $(CONTAINER)
restart :
	docker kill $(CONTAINER)
	docker rm $(CONTAINER)
	docker run --restart=always --name $(CONTAINER) -i -d $(PORTS) $(ENVS) $(VOLUMES) -t $(CONTAINER)
attach:
	docker attach $(CONTAINER)

tail:
	docker logs -f $(CONTAINER)