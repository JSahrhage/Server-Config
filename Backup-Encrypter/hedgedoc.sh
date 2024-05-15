#!/bin/bash

if [ ! -d /app/encrypt/hedgehog ]; then
    mkdir -p /app/encrypt/hedgehog
fi

cd /app/encrypt/hedgehog

rm -rf ./*

docker exec Hedgedoc-Database pg_dump hedgedoc -U hedgedoc > backup.sql
