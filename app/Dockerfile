FROM golang:1.12.5 as dev

WORKDIR /go/src/app
COPY . .
ENV GO111MODULE=on

RUN go get github.com/pilu/fresh
CMD ["fresh"]