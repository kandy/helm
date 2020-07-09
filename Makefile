.PHONY: build
build:
	helm lint src/*
	helm package --destination assets src/*
	helm repo index  .
	git add assets