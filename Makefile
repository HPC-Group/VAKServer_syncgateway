IMAGE=visanalyticskit/vakserver_syncgateway
TAG=1.5.0
CONTAINER=vak_sg

.PHONY: build

build:
	docker build -t $(IMAGE):$(TAG) --rm .

run:
	docker run --name $(CONTAINER) -d -p 4984-4985:4984-4985 $(IMAGE):$(TAG)

rebuild:
	docker stop $(CONTAINER) && docker rm $(CONTAINER) && docker rmi $(IMAGE):$(TAG) && \
	$(MAKE) build && $(MAKE) run