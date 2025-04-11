FROM maven:3-jdk-8-alpine
COPY AgileTC /build
COPY maven_settings.xml /build
WORKDIR /build/case-server
RUN mvn -s /build/maven_settings.xml clean package

FROM openjdk:8-jdk-alpine
WORKDIR /agiletc
COPY --from=0 /build/case-server/target/case-server-1.0-SNAPSHOT.jar ./app.jar
CMD ["java","-jar","/agiletc/app.jar"]
