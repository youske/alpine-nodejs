# Alpine Linux with nodejs
# alpine based

FROM alpine:latest
MAINTAINER youske miyakoshi <youske@gmail.com>

ENV ENTRYKIT_VERSION=0.4.0
ENV ENTRYKIT_FILE=entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz
ENV ENTRYKIT_DOWNLOAD=https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/${ENTRYKIT_FILE}

ENV PATH=/opt/conda/bin:$PATH \
    LANG=C.UTF-8 \
    WORK_DIR=/home/admin \
    PACKAGE='bash nodejs python libstdc++' \
    BUILDPACK='wget ca-certificates build-base linux-headers musl-dev git nodejs-dev'

RUN apk add ${PACKAGE} --no-cache && apk add ${BUILDPACK} --no-cache -t buildpack

# entrykit install
RUN wget -q --no-check-certificate ${ENTRYKIT_DOWNLOAD} -O- | tar zx && \
    chmod +x /entrykit && mv /entrykit /bin && /bin/entrykit --symlink

COPY package.json /package.json
RUN npm install -g gulp pm2 forever

RUN apk del buildpack --no-cache && rm -rf /tmp/* /var/cache/apk/*

RUN adduser -D -h /home/admin -s /bin/bash admin admin

EXPOSE 3000 8000 8080 8088

WORKDIR ${WORK_DIR}
CMD ["bash"]
