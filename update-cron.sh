#! /bin/bash

cd "$(dirname "$0")"

if [ "$1" != "--no-update-check" ]; then
  echo "Checking for newer docker image (pass --no-update-check to suppress this behavior)"
  docker-compose pull cron
else
  echo "Not checking for newer docker image because --no-update-check specified."
  shift
fi

docker-compose up -d cron
