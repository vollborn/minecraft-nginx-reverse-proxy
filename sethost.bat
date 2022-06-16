@echo off

set container="proxy"
set script="/opt/set_host.sh"

docker-compose exec %container% bash %script% %1 %2
