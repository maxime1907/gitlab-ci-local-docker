#!/bin/bash

set -em

# export DOCKER_HOST="unix:///run/user/1000/docker.sock"

USER_ID=$(stat -c '%u' /app)
GROUP_ID=$(stat -c '%g' /app)

echo "Starting docker daemon..."

dockerd-entrypoint.sh dockerd > /var/log/dockerd.log 2>&1 &

while ! docker ps
do
    echo "Waiting for docker daemon..."
    sleep 1
done

echo "Docker daemon started"

echo "Launching gitlab-ci-local $@"

set +e

gitlab-ci-local "$@"

STATUS=$?

set -e

echo "Fixing folder permissions to $USER_ID:$GROUP_ID"

chown -R $USER_ID:$GROUP_ID /app

if [[ "$STATUS" != "0" ]]
then
    exit $STATUS
fi
