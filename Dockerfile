FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY . .

RUN ./gradlew build && ls build/libs

CMD sh -c "java -jar build/libs/*.jar"
