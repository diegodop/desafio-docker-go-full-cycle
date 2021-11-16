FROM golang:alpine3.14 AS builder

WORKDIR /app

COPY ./main.go /app

RUN go build main.go

FROM scratch

COPY --from=builder /app /

CMD ["/main"]