FROM zenika/kotlin:1.3-jdk10

ARG PROJECT_DIR

WORKDIR /
RUN git clone https://github.com/fwcd/KotlinLanguageServer.git
WORKDIR /KotlinLanguageServer
RUN ./gradlew build installDist

ADD . $PROJECT_DIR/kotlin-webservice
WORKDIR $PROJECT_DIR/kotlin-webservice
RUN ./gradlew build
