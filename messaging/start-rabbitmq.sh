#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
CONTAINER_NAME="myalgotiqa-rabbitmq"

runPodmanContainer(){
    if [[ $(podman ps --filter "name=^/$CONTAINER_NAME$" --format '{{.Names}}') == ${CONTAINER_NAME} ]]; then
        echo -n "Stopping old container : "
        podman stop ${CONTAINER_NAME}
    fi

    if [[ $(podman ps -a --filter "name=^/$CONTAINER_NAME$" --format '{{.Names}}') == ${CONTAINER_NAME} ]]; then
        echo -n "Removing old container : "
        podman rm ${CONTAINER_NAME}
    fi

    echo "Starting : $CONTAINER_NAME"

	podman run -d \
		--name ${CONTAINER_NAME} \
		--restart always \
		--hostname algotiqa \
		-p 15672:15672 \
		-p 5672:5672 \
		-e RABBITMQ_DEFAULT_USER=admin \
		-e RABBITMQ_DEFAULT_PASS=admin \
		docker://rabbitmq:3.12.14-management

    if [[ $? == 0 ]]; then
        echo
        echo "Message queue running."
        echo
    fi
}

runPodmanContainer
