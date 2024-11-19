# First stage: build using Maven Wrapper
FROM eclipse-temurin:17 AS build
WORKDIR /app

COPY pom.xml ./
COPY lombok.config ./
COPY .mvn .mvn
COPY mvnw ./
COPY src ./src
COPY resources ./resources
COPY config ./config
COPY README.md ./README.md
COPY application-secret.env  ./application-secret.env
RUN ./mvnw clean package -DskipTests

# Load dependencies (cache this layer)
RUN ./mvnw dependency:resolve

# Copy source code and build the project


# Second stage: create the final image
FROM eclipse-temurin:17-jre-alpine AS final
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/target/*.jar jira.jar

# Указание порта, который будет открыт
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "jira.jar", "--spring.profiles.active=prod"]
