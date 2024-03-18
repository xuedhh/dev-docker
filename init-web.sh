#!/bin/bash

for app in doc-api common-api patient-api admin-center agreement-service-base saas-base-service saas-survey-service bp-api;
do
    export APP_NAME=$app
    envsubst '${APP_NAME},${PHP_HOST}' < /etc/nginx/conf.d/template > /etc/nginx/conf.d/${APP_NAME}.conf
done

nginx -g 'daemon off;'
