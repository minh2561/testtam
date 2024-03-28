#!/home/minh/tesstJenkins/testtam

echo 'git pull'
git pull
echo 'gradlew clean'
./gradlew clean
echo 'build jar'
./gradlew bootJar
echo 'rebuild docker compose'
docker-compose up -d
