FROM openjdk:17-jdk-slim
EXPOSE 8081
ARG JAR_FILE=build/libs/*.jar
ADD ${JAR_FILE} *.jar
ENTRYPOINT ["java","-jar","/test_jenkin-0.0.1-SNAPSHOT.jar.jar"]