FROM openjdk:21

WORKDIR /app

COPY target/multiplex-jdbc-0.0.1-SNAPSHOT.jar /app/multiplex-jdbc-0.0.1-SNAPSHOT.jar
EXPOSE 4080
ENTRYPOINT ["java", "-jar", "multiplex-jdbc-0.0.1-SNAPSHOT.jar"]
