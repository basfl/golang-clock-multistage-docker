FROM golang:1.10 AS builder
RUN mkdir /app
ADD . /app
WORKDIR /app

RUN go get -u github.com/inancgumus/screen &&\
go build -o main .


FROM alpine:latest AS production

COPY  --from=builder /app .
CMD ["./main"]