# Alpine Linux with nodejs
# alpine based
FROM alpine
MAINTAINER youske miyakoshi <youske@gmail.com>
ENV PATH=/opt/conda/bin:$PATH \
    LANG=C.UTF-8 \
    APKINSTALL='bash wget nodejs libstdc++'
RUN apk add --no-cache $APKINSTALL && \
    echo "nodejs install"
RUN adduser -D -h /home/admin -s /bin/bash admin admin
RUN adduser -D -h /home/user -s /bin/bash user user
VOLUME ["/home/user"]
WORKDIR /home/user
#CMD ["redis-server", "/etc/redis/redis.conf"]
EXPOSE 6379 16379 26739
