#!/bin/sh
#!/bin/sh
STOP_LABEL=nextcloud

# Start containers
echo "Starting stopped containers"
docker start $(docker ps -aq -f "label=docker-volume-backup.stop-during-backup=$STOP_LABEL")
