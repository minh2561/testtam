#!/bin/bash

echo 'gradlew clean'
./gradlew clean
sleep 5
echo 'build jar'
./gradlew bootJar
sleep 10
echo 'rebuild docker compose'
docker-compose up -d
