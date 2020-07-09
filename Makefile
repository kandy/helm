.PHONY: build
build:
	helm lint src/*
	helm package --destination assets src/*
	helm repo index repo
	git add assets