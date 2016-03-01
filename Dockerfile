FROM alpine:3.3

RUN apk update && \
apk add python \
tar \
&& rm -rf /var/cache/apk/*

WORKDIR /root/
ADD https://github.com/CouchPotato/CouchPotatoServer/archive/build/3.0.1.tar.gz /root/couchpotato.tar.gz
RUN mkdir CouchPotatoServer && tar xvfz couchpotato.tar.gz -C CouchPotatoServer --strip-components 1

EXPOSE 5050
VOLUME ["/root/.couchpotato"]

CMD [ "python", "/root/CouchPotatoServer/CouchPotato.py"]