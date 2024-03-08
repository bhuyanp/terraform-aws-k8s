#
# Build stage
#
FROM maven:3.9.6-eclipse-temurin-17-alpine AS build
WORKDIR /home
ARG MODULE
RUN echo Building module ${MODULE}
COPY pom.xml .
COPY ${MODULE}/src app/src
COPY ${MODULE}/pom.xml app/pom.xml
RUN mvn -f app/pom.xml clean package -DskipTests=true

#
# Package stage
#
FROM openjdk:17.0.2-slim
COPY --from=build /home/app/target/*.jar /usr/local/lib/app.jar
ENTRYPOINT ["java","-jar","/usr/local/lib/app.jar"]
