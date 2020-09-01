FROM openjdk:8-jdk-alpine
MAINTAINER tarciso
VOLUME /tmp
EXPOSE 8080
ADD build/libs/api-desafio-insight-0.0.1-SNAPSHOT.jar api-desafio-insight.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/api-desafio-insight.jar"]