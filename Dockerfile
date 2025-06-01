FROM eclipse-temurin:21.0.7_6-jdk-alpine@sha256:2f2f553ce09d25e2d2f0f521ab94cd73f70c9b21327a29149c23a2b63b8e29a0 AS build

WORKDIR /workspace/app

RUN apk add --no-cache maven

COPY pom.xml .
COPY src src

RUN mvn package -DskipTests

FROM eclipse-temurin:21.0.7_6-jre-alpine@sha256:8728e354e012e18310faa7f364d00185277dec741f4f6d593af6c61fc0eb15fd

WORKDIR /app

COPY --from=build /workspace/app/target/www-*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"] 