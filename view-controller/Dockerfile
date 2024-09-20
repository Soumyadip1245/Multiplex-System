FROM openjdk:21

WORKDIR /app

COPY target/view-controller-0.0.1-SNAPSHOT.war /app/view-controller-0.0.1-SNAPSHOT.war
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "view-controller-0.0.1-SNAPSHOT.war"]
