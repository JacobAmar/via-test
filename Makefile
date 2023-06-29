all: init deploy
init:
	kind create cluster --config Kindfile.yaml

deploy:
	helmfile sync
redeploy:
	kubectl delete ing/task-ingress
	helmfile sync
destroy:
	kind delete cluster -n via-cluster