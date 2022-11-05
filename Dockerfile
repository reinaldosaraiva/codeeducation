FROM golang:1.16.0-alpine3.13 AS build

LABEL maintainer="Reinaldo Saraiva do Carmo"
LABEL email="reinaldo.saraiva@gmail.com"
LABEL licence="GPLv3"

ENV CGO_ENABLED=0 \
    GOOS=linux

WORKDIR /app

COPY . /app


RUN go build -o main main.go

from scratch

WORKDIR /app

COPY --from=build /app/main ./

CMD ["./main"]