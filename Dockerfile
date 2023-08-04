# Use the official Tomcat image as the base image
FROM tomcat:latest

# Set the working directory to Tomcat's webapps directory
WORKDIR /usr/local/tomcat/webapps

# Copy the WAR file from the local directory to the container's webapps directory
COPY target/sample-webapp.war .

# Expose the default Tomcat port (8080)
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
