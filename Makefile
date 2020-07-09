.PHONY: build
build:
	helm lint src/*
	helm package --destination repo/files src/*
	helm repo index repo
	git add repo