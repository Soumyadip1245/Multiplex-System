FROM openjdk:21

WORKDIR /app

COPY target/mulitplex-service-0.0.1-SNAPSHOT.jar /app/mulitplex-service-0.0.1-SNAPSHOT.jar
EXPOSE 3080
ENTRYPOINT ["java", "-jar", "mulitplex-service-0.0.1-SNAPSHOT.jar"]
