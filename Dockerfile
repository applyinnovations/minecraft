FROM ubuntu:latest

RUN apt-get update && apt-get install -y unzip curl

WORKDIR /server

RUN curl -o server.zip https://mediafilez.forgecdn.net/files/5603/789/BMC4_FORGE_1.20.1_Server_Pack_v30.5.zip \
    && unzip server.zip -d /server \
    && rm server.zip

COPY ./server/variables.txt .
COPY ./server/install_java.sh .

RUN ./install_java.sh

COPY ./server /server

ENTRYPOINT ["./start.sh"]


