FROM maven:3.6.3-openjdk-8

WORKDIR /app

COPY . .

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh" ]

EXPOSE 8080