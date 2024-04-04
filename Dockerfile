FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 go build -ldflags '-extldflags "-static"' -o fullcycle main.go

FROM scratch

COPY --from=builder /app/fullcycle /

CMD ["./fullcycle"]