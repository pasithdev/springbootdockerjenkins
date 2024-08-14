# Description: Dockerfile for Spring Boot application
FROM openjdk:17-jdk-slim
# Add Maintainer Info
WORKDIR /app
# Add a volume pointing to /tmp
ARG JAR_FILE=target/spring-boot-docker*.jar
# Make port 8080 available to the world outside this container
COPY ${JAR_FILE} spring-boot-docker.jar
# Run the jar file
CMD ["java","-jar","-Xmx1024M","/app/spring-boot-docker.jar"]
EXPOSE 8090