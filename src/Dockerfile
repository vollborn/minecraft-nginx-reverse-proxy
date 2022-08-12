FROM debian:latest

LABEL maintainer="vollborn <oliver.vollborn@gmail.com>"
LABEL version="1.1.0"
LABEL description="a simple nginx reverse proxy for minecraft servers"

ENV INITIAL_HOST=""
ENV INITIAL_PORT=""

RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y wget libpcre3-dev build-essential libssl-dev zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN wget https://nginx.org/download/nginx-1.23.1.tar.gz && \
    tar -zxvf nginx-1.*.tar.gz && \
    cd nginx-1.* && \
    ./configure --prefix=/opt/nginx --user=nginx --group=nginx --with-http_ssl_module --with-ipv6 --with-threads --with-stream --with-stream_ssl_module && \
    make && make install && \
    cd .. && rm -rf nginx-1.*

# nginx user
RUN adduser --system --no-create-home --disabled-login --disabled-password --group nginx

# config dirs
RUN mkdir /opt/nginx/http.conf.d && mkdir /opt/nginx/stream.conf.d

ADD startup.sh /opt/startup.sh
ADD set_host.sh /opt/set_host.sh
ADD minecraft.template.conf /opt/minecraft.template.conf
ADD nginx.conf /opt/nginx/conf/nginx.conf

RUN chmod +x /opt/startup.sh
RUN chmod +x /opt/set_host.sh

EXPOSE 25565

CMD ["/opt/startup.sh"]
