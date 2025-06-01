FROM eclipse-temurin:21.0.7_6-jdk-alpine AS build

WORKDIR /workspace/app

RUN apk add --no-cache maven

COPY pom.xml .
COPY src src

RUN mvn package -DskipTests

FROM eclipse-temurin:21.0.7_6-jre-alpine

WORKDIR /app

COPY --from=build /workspace/app/target/www-*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"] 