FROM amazoncorretto:17 AS build

WORKDIR /app

COPY build.gradle .
COPY settings.gradle .
COPY gradlew .
COPY gradle/ ./gradle/
COPY src ./src

RUN chmod +x ./gradlew
RUN ./gradlew build -x test

FROM openjdk:17-ea-11-jdk-slim

ARG JAR_FILE=/build/libs/*.jar
COPY --from=build /app${JAR_FILE} /app.jar

ENTRYPOINT [ \
  "java", \
  "-jar", \
  "app.jar" \
]
