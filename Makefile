all: container

PREFIX?=nenya.local:5000/iop
FLAGS=
ARCH?=amd64
ALL_ARCHITECTURES=amd64 arm arm64 ppc64le s390x
ML_PLATFORMS=linux/amd64,linux/arm,linux/arm64,linux/ppc64le,linux/s390x
GOLANG_VERSION?=1.8

OVERRIDE_IMAGE_NAME=
VERSION?=v1.0.0
GIT_COMMIT:=$(shell git rev-parse --short HEAD)

container:	
	docker build -t $(PREFIX)/console:$(VERSION) .
ifneq ($(OVERRIDE_IMAGE_NAME),)
	docker tag $(PREFIX)/console:$(VERSION) $(OVERRIDE_IMAGE_NAME)
endif


