# Use an OpenJDK image for running the Spring Boot JAR
FROM openjdk:21

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file into the container
COPY target/eureka-server-0.0.1-SNAPSHOT.jar /app/eureka-server-0.0.1-SNAPSHOT.jar
EXPOSE 8761
# Run the application
ENTRYPOINT ["java", "-jar", "eureka-server-0.0.1-SNAPSHOT.jar"]
