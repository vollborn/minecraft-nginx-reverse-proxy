#!/usr/bin/env bash

container="proxy"
script="/opt/set_host.sh"

docker compose exec $container bash $script "$1" "$2"
