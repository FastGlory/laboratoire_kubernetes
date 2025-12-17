FROM maven:3.8-jdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /app/target/todo-app.jar /app/todo-app.jar

CMD ["java", "-jar", "todo-app.jar"]
