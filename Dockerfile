FROM maven:3.6.0-jdk-13 as build

WORKDIR /usr/src/app

COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package


FROM openjdk:13

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/target/payment-0.0.1-SNAPSHOT-jar-with-dependencies.jar /usr/app/payment-0.0.1-SNAPSHOT-jar-with-dependencies.jar

CMD ["java","-jar","/usr/app/payment-0.0.1-SNAPSHOT-jar-with-dependencies.jar"]
