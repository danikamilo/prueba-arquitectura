FROM openjdk:11
VOLUME /tmp
EXPOSE 8089
ADD ./target/spring-micro-services-0.0.1.jar app.jar
ENTRYPOINT {"java" , "-jar" , "/app.jar*" }