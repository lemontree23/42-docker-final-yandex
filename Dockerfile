
FROM golang:1.22 AS build-stage

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o 42-docker-final

FROM alpine:3.20.1

WORKDIR /app

COPY --from=build-stage /app /app

ENTRYPOINT ["/app/42-docker-final"]
