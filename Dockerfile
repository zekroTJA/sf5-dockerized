FROM ghcr.io/zekrotja/minebase:zulu-21

COPY scripts/ scripts/
COPY template.server.properties .
COPY patch/ patch/

RUN bash ./scripts/download-latest.sh server.zip \
    && unzip server.zip \
    && rm server.zip

RUN bash ./Install.sh

RUN test -d ./config && mv ./config ./config.tmp

# RUN chmod +x ./startserver.sh

RUN chmod +x scripts/*.sh

RUN echo "eula=true" > eula.txt

ENV XMX="4G" \
    XMS="2G" \
    BACKUP_LOCATION="/var/mcserver/world/"