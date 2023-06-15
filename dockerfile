#FROM tomcat:10-jdk11-openjdk-slim
#
## Set the working directory
#WORKDIR /usr/local/tomcat/webapps
#
## Copy the application files to the container
#COPY target/javaeeTest-1.0-SNAPSHOT.war .
#
## Expose the default HTTP port
#EXPOSE 8080
FROM tomcat:10-jdk11-openjdk-slim

# Set the working directory
WORKDIR /usr/local/tomcat

# Allow Tomcat to read and write files
RUN chown -R 1000:1000 /usr/local/tomcat

# Set the working directory for webapps
WORKDIR /usr/local/tomcat/webapps

# Copy the application files to the container
COPY target/javaeeTest-1.0-SNAPSHOT.war .

# Expose the default HTTP port
EXPOSE 8080