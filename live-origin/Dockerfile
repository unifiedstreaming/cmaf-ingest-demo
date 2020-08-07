FROM unifiedstreaming/origin:1.10.18
LABEL maintainer "Unified Streaming <support@unified-streaming.com>"


COPY server.crt /etc/apache2/ssl/server.crt
COPY server.key /etc/apache2/ssl/server.key

RUN apk --update add apache2-ssl 
RUN apk --update add apache2-proxy


# overwrite config and entrypoint
COPY ssl.conf /etc/apache2/conf.d/ssl.conf
COPY unified-origin.conf.in /etc/apache2/conf.d/unified-origin.conf.in
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

RUN mv /var/www/unified-origin /var/www/live
