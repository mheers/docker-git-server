FROM golang:1.20-alpine AS builder

RUN go install code.gitea.io/tea@v0.9.2

FROM gitea/gitea:1.19.1

RUN apk add --no-cache sudo

COPY --from=builder /go/bin/tea /usr/local/bin/tea
