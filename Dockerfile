FROM openjdk:17-jdk-slim
COPY target/jira.jar ./jira.jar
COPY resources ./resources
COPY config ./config
COPY src/main/resources/application.yaml /app/resources/application.yaml

EXPOSE 8080
ENTRYPOINT ["java","-jar","jira.jar", "--spring.profiles.active=prod", "--debug"]

