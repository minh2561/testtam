#!/usr/bin/env bash
echo 'Pull from git branch develop'
git pull
echo 'gradlew clean'
./gradlew clean
echo 'build jar'
./gradlew bootJar
echo 'rebuild docker compose'
docker-compose up -d --build