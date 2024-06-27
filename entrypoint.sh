#!/bin/bash

wait_for_db() {
  while ! nc -z db 3306; do
    echo "Waiting for the database to be ready..."
    sleep 2
  done
  echo "Database is ready!"
}

apt update && \
apt install nodejs npm netcat -y && \
mvn package && \
npm install && \

wait_for_db

java -Xms64m -Xmx128m -Ddatasource.dialect="${DB_DIALECT}" \
-Ddatasource.url="${DB_URL}" \
-Ddatasource.username="${DB_USER}" \
-Ddatasource.password="${DB_PASS}" \
-Dspring.profiles.active="${SPRING_PROFILE}" \
-jar /app/target/lavagna-jetty-console.war --headless
