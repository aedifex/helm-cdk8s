# Variables
APP_NAME := harness
DOCKER_IMAGE := 824987503353.dkr.ecr.us-west-2.amazonaws.com/$(APP_NAME)

TAG := latest
BINARY := main_linux

COMMIT_SHA := unknown
DEPLOYED_BY := unknown
GIT_BRANCH := unknown

# Default target
.PHONY: all
all: build

# Build the Go binary
.PHONY: build
build:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 \
	go build -ldflags "\
		-X 'main.CommitSHA=$(COMMIT_SHA)' \
		-X 'main.git_branch=$(GIT_BRANCH)' \
		-X 'main.deployed_by=$(DEPLOYED_BY)'" \
		-o $(BINARY) .

# Run the application locally
.PHONY: run
run: build
	./$(BINARY)

# Run tests
.PHONY: test
test:
	go test ./... -v

# Build the Docker image
.PHONY: docker-build
docker-build:
	docker build --platform linux/amd64 -t $(DOCKER_IMAGE):$(TAG) .

docker-build-ecr:
	docker build --platform linux/amd64 -t $(DOCKER_IMAGE):$(TAG) .

# Push the Docker image
.PHONY: docker-push
docker-push: docker-build
	docker push $(DOCKER_IMAGE):$(TAG)

# Clean up local files
.PHONY: clean
clean:
	rm -f $(BINARY)
	docker image prune -f

# CI Pipeline Target
.PHONY: ci
ci: build test docker-build docker-push