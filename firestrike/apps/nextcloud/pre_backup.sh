#!/bin/sh
EXEC_LABEL=nextcloud_database
STOP_LABEL=nextcloud
# Get container for exec pre
CONTAINER_ID=$(docker ps -f label=docker-volume-backup.exec-label=$EXEC_LABEL -aq)
COMMAND=$(docker inspect $CONTAINER_ID --format '{{ index .Config.Labels "docker-volume-backup.exec-pre"}}')
echo Executing "$COMMAND" on container $CONTAINER_ID
sh -c "docker exec $CONTAINER_ID $COMMAND"

# Stop containers
echo "Stopping containers"
docker stop $(docker ps -aq -f "label=docker-volume-backup.stop-during-backup=$STOP_LABEL")
