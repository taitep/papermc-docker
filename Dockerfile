ARG JAVA_VERSION
FROM eclipse-temurin:${JAVA_VERSION}-jre

RUN apt-get update && \
    apt-get install jq -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

RUN groupadd -g 2000 minecraft && \
    useradd -r -u 2000 -g minecraft minecraft

RUN mkdir -p /server /jarcache && chown minecraft:minecraft /server /jarcache

USER minecraft

WORKDIR /server

COPY start.sh /start.sh

EXPOSE 25565

ENTRYPOINT ["/start.sh"]
