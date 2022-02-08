#!/bin/bash

container="proxy"
script="/opt/nginx/sbin/set_host.sh"

docker-compose exec $container bash $script $1
