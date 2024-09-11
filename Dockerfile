ARG JAVA_VERSION
FROM eclipse-temurin:${JAVA_VERSION}-jre

RUN apt-get update && \
    apt-get install jq -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

WORKDIR /server

COPY start.sh /start.sh

EXPOSE 25565

ENTRYPOINT ["/start.sh"]
