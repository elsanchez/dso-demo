FROM maven:3.8.7-openjdk-18 AS BUILD
WORKDIR /app
COPY .  .

RUN mvn package -DskipTests

FROM  openjdk:19-jdk-alpine3.16
WORKDIR /run
COPY --from=BUILD /app/target/demo-0.0.1-SNAPSHOT.jar demo.jar
EXPOSE 8080
CMD java  -jar /run/demo.jar
