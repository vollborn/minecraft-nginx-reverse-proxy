@echo off

set container="proxy"
set script="/opt/nginx/sbin/set_host.sh"

docker-compose exec %container% bash %script% %1
