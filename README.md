# Minecraft NGINX Reverse Proxy

This project is based on [tekn0irs](https://github.com/tekn0ir) [nginx-stream](https://github.com/tekn0ir/nginx-stream).

## Requirements
- A webserver with a static IP address supporting Docker

## Setup
Clone this project to your webserver.
```
git clone https://github.com/vollborn/minecraft-nginx-reverse-proxy.git
```

Enter the cloned directory.
```shell
cd minecraft-nginx-reverse-proxy
```

Run docker-compose build to build the container.
```
docker-compose build
```

## Running

You can start the container by executing this command:
```shell
docker-compose up -d
```

To set the host IP address you need to execute the following command:

```shell
# Windows
sethost <ip>

# Linux
bash ./sethost.sh <ip>
```

Here we go.
<br>You should be up and running!
