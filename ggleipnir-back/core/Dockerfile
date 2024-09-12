FROM mirror.gcr.io/library/gradle:8.1.1 AS BUILD

WORKDIR /opt/app

COPY . .

RUN gradle build -x test

FROM mirror.gcr.io/library/openjdk:17.0.1-jdk-slim

ARG JAR_FILE=/opt/app/build/libs/*SNAPSHOT.jar

WORKDIR /opt/app

COPY --from=BUILD ${JAR_FILE} ggleipnir-back.jar

ENTRYPOINT ["java","-jar","ggleipnir-back.jar"]


