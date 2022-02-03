FROM alpine:latest

RUN apk update
RUN apk add tar

WORKDIR /app

COPY element-v1.9.9.tar.gz .
COPY config.json .

RUN tar -xf element-v1.9.9.tar.gz

# CMD ["balena-idle"]