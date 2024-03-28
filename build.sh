#!/usr/bin/env bash
file_path='/home/minh/tesstJenkins/testtam'

if [ ! -e "$file_path" ]; then
    echo "Tệp $file_path không tồn tại."
    git clone https://github.com/minh2561/testtam.git
    echo 'cấp quyền thực thi'
    chmod +x gradlew
fi
echo 'git pull'
git pull
echo 'gradlew clean'
./gradlew clean
echo 'build jar'
./gradlew bootJar
echo 'rebuild docker compose'
docker compose up -d