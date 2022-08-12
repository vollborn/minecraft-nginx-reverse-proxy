#!/bin/bash

if [[ -n ${INITIAL_HOST} ]] && [[ -n ${INITIAL_PORT} ]]; then
    echo "Initial host values set."
    bash /opt/set_host.sh "${INITIAL_HOST}" "${INITIAL_PORT}" true
fi

echo "Starting nginx..."

/opt/nginx/sbin/nginx -g 'daemon off;'
