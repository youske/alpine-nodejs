# Alpine Linux with nodejs
# alpine based

FROM alpine
MAINTAINER youske miyakoshi <youske@gmail.com>

ENV PATH=/opt/conda/bin:$PATH \
    LANG=C.UTF-8 \
    GOSU=https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64 \
    APKINSTALL='bash wget nodejs nodejs-dev python git libstdc++'

RUN adduser -D -h /home/admin -s /bin/bash admin admin && \
    apk add --no-cache $APKINSTALL && \
    wget -q --no-check-certificate -O /usr/local/bin/gosu ${GOSU} && \
    chmod +x /usr/local/bin/gosu

COPY entrypoint.sh /docker-entrypoint.sh

EXPOSE 3000 8000 8080

VOLUME ["/home/admin"]
WORKDIR /home/admin
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["bash"]
