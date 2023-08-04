# Stage 1: Build Java web application using Maven
FROM maven:latest AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
COPY target/sample-webapp.war .
RUN mvn clean package

# Stage 2: Create final image using Tomcat
FROM tomcat:latest
WORKDIR /usr/local/tomcat/webapps
COPY --from=build /app/target/sample-webapp.war .
EXPOSE 8080
CMD ["catalina.sh", "run"]
