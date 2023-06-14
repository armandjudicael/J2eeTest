# Use a base image with Apache Tomcat and Java 11
FROM adoptopenjdk:11-jdk-hotspot AS builder

# Set the Tomcat version
ARG TOMCAT_VERSION=10.0.14

# Download and extract Apache Tomcat
RUN apt-get update && \
    apt-get install -y curl && \
    mkdir -p /opt/tomcat && \
    curl -SL https://downloads.apache.org/tomcat/tomcat-10/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    | tar -xzC /opt/tomcat --strip-components=1

# Copy the application artifact to the webapps directory
COPY target/javaeeTest-1.0-SNAPSHOT.war /opt/tomcat/webapps/ROOT.war

# Set the CATALINA_HOME environment variable
ENV CATALINA_HOME /opt/tomcat

# Expose the default HTTP port
EXPOSE 8082

# Start Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]