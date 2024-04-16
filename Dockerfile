FROM golang:1.22.2-alpine as build
RUN mkdir /src
ADD ./echo-server/*.go /src
ADD ./echo-server/go.mod /src
ADD ./echo-server/go.sum /src
WORKDIR /src
RUN go get -d -v -t
RUN GOOS=linux go build -v -o echo-server
RUN chmod +x echo-server

FROM scratch
COPY --from=build /src/echo-server /usr/local/bin/echo-server
EXPOSE 8080
CMD ["echo-server"]