#!/bin/bash

if [ ! -d /app/encrypt/gitlab ]; then
    mkdir -p /app/encrypt/gitlab
fi

rm -rf /app/encrypt/gitlab/*

rm -rf /app/gitlab/backups/*

docker exec -t GitLab gitlab-backup create

mkdir /app/encrypt/gitlab/backup

cp -r /app/gitlab/backups/* /app/encrypt/gitlab/backup/

mkdir /app/encrypt/gitlab/config

cp /app/gitlab/config/gitlab.rb /app/encrypt/gitlab/config/gitlab.rb

cp /app/gitlab/config/gitlab-secrets.json /app/encrypt/gitlab/config/gitlab-secrets.json
