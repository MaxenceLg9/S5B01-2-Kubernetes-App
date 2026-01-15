#!/bin/bash
if test "$#" -lt 1; then
        echo "Name of version required"
else
	docker build web/nailloux-web -t nailloux-web
	docker build web/init-container -t init-container

	docker tag init-container:latest nailloux.registry.com/init-container:$1
	docker tag nailloux-web:latest nailloux.registry.com/nailloux-web:$1

	docker push nailloux.registry.com/init-container:$1
	docker push nailloux.registry.com/nailloux-web:$1
fi
