#!/bin/bash

sourceFile="/opt/minecraft.template.conf"
configFile="/opt/nginx/stream.conf.d/minecraft.conf"

nginxFile="/opt/nginx/sbin/nginx"

yes | cp -fi "$sourceFile" "$configFile" &> /dev/null

sed -i "s/<minecraft>/$1/" "$configFile"

$nginxFile -s reload
