PROJECT ?= agsmith/hrobot
TAG     ?= latest
IMAGE    = $(PROJECT):$(TAG)

.PHONY: build test run shell repl

build:
	docker build -t $(IMAGE) .

test: build
	docker run --rm -it $(IMAGE) cabal test

run: build
	docker run --rm -it $(IMAGE) cabal run

shell: build
	docker run --rm -it -v $(PWD):/src $(IMAGE) bash

repl: build
	docker run --rm -it $(IMAGE) cabal repl
