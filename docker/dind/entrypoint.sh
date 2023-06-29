#!/bin/bash

set -em

USER_ID=$(stat -c '%u' /app)
GROUP_ID=$(stat -c '%g' /app)

echo "Launching gitlab-ci-local $@"

set +e

gitlab-ci-local "$@"

STATUS=$?

set -e

echo "Fixing folder permissions to $USER_ID:$GROUP_ID"

chown -R $USER_ID:$GROUP_ID /app

echo "exit $STATUS"
exit $STATUS