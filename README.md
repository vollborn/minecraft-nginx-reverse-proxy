# Minecraft NGINX Reverse Proxy

This project is based on [tekn0irs](https://github.com/tekn0ir) [nginx-stream](https://github.com/tekn0ir/nginx-stream).


## Requirements
- A webserver with a static IP address supporting Docker


## Setup

This image is available at [Docker Hub](https://hub.docker.com/r/vollborn/minecraft-nginx-reverse-proxy).

### Using docker run
You can run it by using the following command:
```shell
docker run -p 25565:25565 -e INITIAL_HOST=<host> -e INITIAL_PORT=<port> vollborn/minecraft-nginx-reverse-proxy
```

### Using docker compose
You can also use docker-compose.
Example docker-compose.yml:
```yml
version: "3.8"

services:
  proxy:
    image: vollborn/minecraft-nginx-reverse-proxy
    restart: unless-stopped
    ports:
      - "${LOCAL_PORT:-25565}:25565"
    environment:
      INITIAL_HOST: <host>
      INITIAL_PORT: <port>
      # TZ: "Europe/Berlin"
```

Here we go.
<br>You should be up and running!


## Development Setup
Clone this project to your webserver.
```
git clone https://github.com/vollborn/minecraft-nginx-reverse-proxy.git
```

Enter the cloned directory.
```shell
cd minecraft-nginx-reverse-proxy
```

Then you need to copy the .env.example file. For that, run:
```shell
cp .env.example .env
```

Run docker-compose build to build the container.
```shell
docker-compose build
```


### Starting the development container

You can start the container by executing this command:
```shell
docker-compose up -d
```

To change the host IP address or port without restarting the container, you can to execute the following command:

```shell
# Windows
sethost <ip> <port>

# Linux
bash ./sethost.sh <ip> <port>
```

Examples:
```shell
# Windows
sethost 192.168.178.99 25565

# Linux
bash ./sethost.sh 192.168.178.99 25565
```
