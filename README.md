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

Here we go.
<br>You should be up and running!
