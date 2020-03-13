.PHONY: build local

dev:
	dep ensure
	docker-compose up --force-recreate

build-docker:
	docker build -t gin-microservice .

clean:
	rm -rf ./bin
