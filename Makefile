IMAGE = empatica/serverless
VERSION = $(shell cat Dockerfile | awk '/SERVERLESS_VERSION=/ { split($$0, a, "=") ; print a[2]}')

.PHONY: build push release

default: release

build: Dockerfile
	docker build -t $(IMAGE):$(VERSION) .

push:
	docker push $(IMAGE):$(VERSION)

release: build push
	docker tag $(IMAGE):$(VERSION) $(IMAGE):latest
	docker push $(IMAGE):latest
