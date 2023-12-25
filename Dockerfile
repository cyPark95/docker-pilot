FROM openjdk:17-alpine
ARG JAR_FILE=/build/libs/docker-pilot-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} /app.jar
ENTRYPOINT [ \
  "java", \
#  "-Dspring.profiles.active=${PROFILE}",\
  "-jar", \
  "app.jar" \
]