NS = sh4rk
REPO = ubuntu
VERSION ?= latest

default: deps build

deps:
	docker pull ubuntu:trusty

build:
	docker build -t $(NS)/$(REPO):$(VERSION) --force-rm=true .
