# Stage 1: Build
FROM golang:1.27.3-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go build -o employee-api .

# Stage 2: Runtime
FROM alpine:3.24

RUN apk update && apk upgrade --no-cache

WORKDIR /app

COPY --from=builder /app/employee-api .

EXPOSE 8080

CMD ["./employee-api"]
