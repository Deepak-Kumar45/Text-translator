FROM openjdk:18
WORKDIR /app
COPY ./target/text_translator-0.0.1-SNAPSHOT.jar /app
EXPOSE 8080
CMD ["java", "-jar", "text_translator-0.0.1-SNAPSHOT.jar"]
