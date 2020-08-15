.DEFAULT_GOAL := help
.SILENT:

## Display usage
help:
	@awk '/^[a-zA-Z\-\_0-9%:\\\/]+:/ { \
	  helpMessage = match(lastLine, /^## (.*)/); \
	  if (helpMessage) { \
	    helpCommand = $$1; \
	    helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
      gsub("\\\\", "", helpCommand); \
      gsub(":+$$", "", helpCommand); \
	    printf "  \x1b[32;01m%-35s\x1b[0m %s\n", helpCommand, helpMessage; \
	  } \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST) | sort -u
	@printf "\n"

## Build the Docker image for the provided package and version (make build PACKAGE=dummy VERSION=0.1.0)
build:
	cd $(PACKAGE) && docker build --build-arg VERSION=$(VERSION) --tag jmfontaine/whalebrew-$(PACKAGE):$(VERSION) .

## Delete installed test Whalebrew packages (make clean-test)
clean-test:
	for package in $$(whalebrew list | awk '$$1 ~ /.*-test$$/ {print $$1}') ; do \
		whalebrew uninstall $${package} ; \
	done

## Publish the Docker image for the provided package and version (make publish PACKAGE=dummy VERSION=0.1.0)
publish:
	docker push jmfontaine/whalebrew-$(PACKAGE):$(VERSION)
	docker tag jmfontaine/whalebrew-$(PACKAGE):$(VERSION) jmfontaine/whalebrew-$(PACKAGE):latest
	docker push jmfontaine/whalebrew-$(PACKAGE):latest

## Install the Docker image for the provided package and version (make test PACKAGE=dummy VERSION=0.1.0)
test:
	whalebrew install --force --name $(PACKAGE)-$(VERSION)-test jmfontaine/whalebrew-$(PACKAGE):$(VERSION)
