GOCMD?=go
GOBUILD?=$(GOCMD) build
GOCLEAN?=$(GOCMD) clean
GOTEST?=$(GOCMD) test

BINARY_NAME=oci-add-hooks
SOURCES=$(shell find . -name '*.go')
COMMIT=$(shell git rev-list -1 HEAD)

all: test build

.PHONY: build test clean

build: $(BINARY_NAME)
$(BINARY_NAME): $(SOURCES)
	$(GOBUILD) -ldflags="-X main.commit=$(BINARY_NAME)-$(COMMIT)" -o $(BINARY_NAME)
test:
	$(GOTEST) -v ./...

clean:
	$(GOCLEAN)
	rm -f $(BINARY_NAME)
