#!/bin/bash

apt update && \
apt install nodejs npm -y && \
mvn package && \
npm install && \
mvn jetty:run