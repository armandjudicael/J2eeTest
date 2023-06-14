# J2eeTest

[![GitHub Issues](https://img.shields.io/github/issues/armandjudicael/J2eeTest.svg)](https://github.com/armandjudicael/J2eeTest/issues)
[![GitHub Stars](https://img.shields.io/github/stars/armandjudicael/J2eeTest.svg)](https://github.com/armandjudicael/J2eeTest/stargazers)
## Table of Contents

- [Projet Screenshoot](#Project Screenshot)
- [Installation](#installation)
- [Usage](#usage)
- [Technologies](#technologies)
- [Dependencies](#contributing)

## Project Screenshot

- Person List

![Project Screenshot](https://github.com/armandjudicael/J2eeTest/raw/master/Canditat.png)

- Support Multiple file

![Project Screenshot](https://github.com/armandjudicael/J2eeTest/raw/master/multipledocument.png)

- View and download attachement

![Project Screenshot](https://github.com/armandjudicael/J2eeTest/raw/master/attachement.png)

- Form validation

![Project Screenshot](https://github.com/armandjudicael/J2eeTest/raw/master/form-validation.png)

## Description

JavaEETest is a Java EE web application built using Maven. It utilizes several libraries and frameworks to showcase different aspects of Java EE development. The project includes the following features:

- Integration of Jakarta EE (formerly Java EE) web APIs
- Usage of Jakarta EE implementation of JSP Standard Tag Library (JSTL)
- Simplified Java code with the help of Lombok annotations
- File I/O operations using Apache Commons IO
- Object-Relational Mapping (ORM) with Hibernate
- XML binding using JAXB runtime
- Generating fake data for testing with JavaFaker
- Unit testing with JUnit Jupiter
- Persistence using the H2 Database Engine

## Technologies Used

- Java EE (Enterprise Edition)
- HTML
- CSS
- JavaScript
- Bootstrap 5
- Hibernate 6
- Jquery 3

## Prerequisites

- Java 17
- Java EE development environment (e.g., Eclipse, IntelliJ IDEA)
- Docker (To run the application without struggling Tomcat )

## Getting Started

1. Pull docker image :

   ```shell
   docker pull javaeeTest:latest

2. run the docker image :
   ```shell
    docker run -p 8082:8082 javaeeTest

3. Open the link below to your browser :
   ```shell
    http://localhost:8082/javaeeTest_war/

4. Source code available at :
   ```shell
    https://github.com/armandjudicael/J2eeTest.git

## Dependencies

The project relies on the following dependencies:

- Jakarta EE (formerly Java EE) web API: 9.1.0
- Jakarta EE implementation of JSP Standard Tag Library (JSTL): 2.0.0
- Lombok: 1.18.28
- Apache Commons IO: 2.11.0 and 2.13.0
- Hibernate ORM: 6.0.2.Final
- JAXB runtime: 3.0.2
- JavaFaker: 1.0.2
- JUnit Jupiter: 5.9.1
- H2 Database Engine: 2.1.214

Please refer to the [pom.xml](./pom.xml) file for detailed information on the project's dependencies.

