# Alpine Linux with nodejs
# alpine based

FROM alpine:latest
MAINTAINER youske miyakoshi <youske@gmail.com>

LABEL com.geeplus.description="alpine nodejs image" \
      com.geeplus.role="baseimage"

ENV ENTRYKIT_VERSION=0.4.0
ENV ENTRYKIT_FILE=entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz
ENV ENTRYKIT_DOWNLOAD=https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/${ENTRYKIT_FILE}

ENV GOSU_VERSION=1.7
ENV GOSU_DOWNLOAD=https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64

ENV PATH=$PATH \
    LANG=C.UTF-8 \
    WORK_DIR=/home/admin \
    PACKAGE='bash nodejs ca-certificates' \
    BUILDPACK='wget build-base linux-headers musl-dev git nodejs-dev'

RUN apk update --no-cache && apk add ${PACKAGE} --no-cache && apk add ${BUILDPACK} --no-cache -t buildpack

# entrykit install
RUN wget -q --no-check-certificate ${ENTRYKIT_DOWNLOAD} -O- | tar zx && \
    chmod +x /entrykit && mv /entrykit /bin && /bin/entrykit --symlink

# gosu
RUN wget -q --no-check-certificate ${GOSU_DOWNLOAD} -O /usr/bin/gosu && chmod +x /usr/bin/gosu

COPY package.json /package.json
RUN npm install -g gulp pm2 forever

RUN apk del buildpack --no-cache && rm -rf /tmp/* /var/cache/apk/*

RUN adduser -D -h /home/admin -s /bin/bash admin admin

EXPOSE 3000 8000 8080 8088

WORKDIR ${WORK_DIR}
CMD ["bash"]
