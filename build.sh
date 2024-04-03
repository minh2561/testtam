#!/bin/bash

echo 'gradlew clean'
./gradlew clean
echo 'build jar'
./gradlew bootJar
echo 'rebuild docker compose'
docker-compose up -d
