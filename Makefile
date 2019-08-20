image:
	docker build -t mtproxy .

push:
	docker tag mtproxy:latest opedge/mtproxy:latest
	docker push opedge/mtproxy:latest
