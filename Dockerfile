FROM maven:3.6.3-openjdk-8

WORKDIR /app

COPY . .

ENV DB_DIALECT HSQLDB
ENV DB_URL jdbc:hsqldb:file:lavagna
ENV DB_USER sa
ENV DB_PASS ""
ENV SPRING_PROFILE dev

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh" ]

EXPOSE 8080