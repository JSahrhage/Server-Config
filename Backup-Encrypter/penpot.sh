#!/bin/bash

if [ ! -d /app/encrypt/penpot ]; then
    mkdir -p /app/encrypt/penpot
fi

cd /app/penpot

docker compose down

cp -r /app/penpot/assets /app/encrypt/penpot/

cp -r /app/penpot/postgres /app/encrypt/penpot/

docker volume prune --force

docker compose up -d
