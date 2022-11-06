FROM alpine:3.16

ENV C_USER=app
ENV C_UID=1000
ENV C_GROUP=app
ENV C_GID=1000

ENV C_HOME=/app
ENV C_CONFIG=/config

ENV C_TIMEZONE=Europe/Copenhagen

# Set timezone
RUN apk add tzdata
RUN cp /usr/share/zoneinfo/${C_TIMEZONE} /etc/localtime
RUN apk del tzdata
RUN echo ${C_TIMEZONE} > /etc/timezone

# Create user, group, permissions and base direcotries
RUN mkdir -p ${C_HOME}
RUN mkdir -p ${C_CONFIG}
RUN addgroup -S ${C_GROUP} -g ${C_GID} && \
    adduser -S ${C_USER} -u ${C_UID} -G ${C_GROUP} -h ${C_HOME} -D
RUN chown -R ${C_UID}:${C_GID} ${C_HOME}
RUN chown -R ${C_UID}:${C_GID} ${C_CONFIG}

RUN rm -rf /tmp/*

USER app
WORKDIR ${C_HOME}

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
