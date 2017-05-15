FROM golang:1.8.0-alpine AS build
COPY server.go src/
RUN go build src/server.go

FROM alpine:3.5
RUN apk -U add curl
COPY --from=build /go/server /server
EXPOSE 80
CMD ["/server"]
