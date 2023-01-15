#!/usr/bin/env bash

sourceFile="/opt/minecraft.template.conf"
configFile="/opt/nginx/stream.conf.d/minecraft.conf"

nginxFile="/opt/nginx/sbin/nginx"

# shellcheck disable=SC2216
yes | cp -fi "$sourceFile" "$configFile" &> /dev/null

sed -i "s/<host>/$1/" "$configFile"
sed -i "s/<port>/$2/" "$configFile"

# only reload if not booting up
if [ -z "$3" ]; then
    $nginxFile -s reload
fi
