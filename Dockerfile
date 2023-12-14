FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

# Use a base image with OpenJDK to run Java applications
FROM openjdk:11-jre-slim
COPY --from=build /target/chatapp.jar chatapp.jar
EXPOSE 8080
CMD ["java", "-jar", "chatapp.jar"]