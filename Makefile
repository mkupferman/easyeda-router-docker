IMAGENAME = easyeda-router
LPORT = 8080

all: build

build:
	docker build -f Dockerfile -t $(IMAGENAME) .

run:
	docker-compose up $(IMAGENAME)

shell:
	docker-compose run --rm --service-ports $(IMAGENAME)-shell

clean:
	docker-compose down --rmi all --volumes
