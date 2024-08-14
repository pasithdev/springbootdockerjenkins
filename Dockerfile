# Description: Dockerfile for Spring Boot application
FROM openjdk:17-jdk-slim
FROM maven:3.8.4-openjdk-17-slim
# Add Maintainer Info
WORKDIR /app
COPY . .
# Add a volume pointing to /tmp
ARG JAR_FILE=target/spring-boot-docker*.jar
# Add the application's jar to the container
RUN mvn clean package
# Make port 8080 available to the world outside this container
COPY ${JAR_FILE} spring-boot-docker.jar
# Run the jar file
CMD ["java","-jar","-Xmx1024M","/app/spring-boot-docker.jar"]

#ENTRYPOINT ["java", "-jar","-Xmx1024M", "/target/spring-boot-docker.jar"]
# Expose the port the app runs in
EXPOSE 8090