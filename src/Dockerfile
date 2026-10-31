FROM debian:13-slim

LABEL maintainer="vollborn <oliver.vollborn@gmail.com>"
LABEL version="1.4.0"
LABEL description="a simple nginx reverse proxy for minecraft servers"

ENV TZ="Europe/Berlin"

ENV INITIAL_HOST=""
ENV INITIAL_PORT=""

WORKDIR /opt

RUN groupadd nginx && \
    useradd --system --no-create-home --shell /usr/sbin/nologin --password="" -g nginx nginx

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y wget libpcre2-dev build-essential libssl-dev zlib1g-dev && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://nginx.org/download/nginx-1.30.6.tar.gz && \
    tar -zxvf nginx-1.*.tar.gz && \
    cd nginx-1.* && \
    ./configure --prefix=/opt/nginx --user=nginx --group=nginx --with-http_ssl_module --with-ipv6 --with-threads --with-stream --with-stream_ssl_module && \
    make && \
    make install && \
    cd .. && \
    rm -rf nginx-1.* && \
    apt-get purge -y wget libpcre2-dev build-essential libssl-dev zlib1g-dev

RUN mkdir -p /opt/nginx/http.conf.d /opt/nginx/stream.conf.d && \
    chown -R nginx:nginx /opt/nginx

ADD startup.sh /opt/startup.sh
ADD set_host.sh /opt/set_host.sh
ADD minecraft.template.conf /opt/minecraft.template.conf
ADD nginx.conf /opt/nginx/conf/nginx.conf

RUN chmod +x /opt/startup.sh && \
    chmod +x /opt/set_host.sh

RUN mkdir -p /var/log/nginx && \
    ln -s /dev/stdout /var/log/nginx/access.log && \
    ln -s /dev/stderr /var/log/nginx/error.log

EXPOSE 25565
USER nginx

CMD ["/opt/startup.sh"]
