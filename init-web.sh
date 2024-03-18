#!/bin/bash

for app in remote-api;
do
    export APP_NAME=$app
    envsubst '${APP_NAME},${PHP_HOST}' < /etc/nginx/conf.d/template > /etc/nginx/conf.d/${APP_NAME}.conf
done

nginx -g 'daemon off;'
