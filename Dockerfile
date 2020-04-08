# dmp-golang-ci image
FROM circleci/golang:1.14

# Install gorunpkg
RUN go get github.com/vektah/gorunpkg

# Install junit
RUN go get -v github.com/jstemmer/go-junit-report

# Install golangci-lint
RUN go get -d -u -v github.com/golangci/golangci-lint/cmd/golangci-lint

# Protobuf
ENV PROTOC_ZIP=protoc-3.7.1-linux-x86_64.zip
RUN curl -OL https://github.com/google/protobuf/releases/download/v3.7.1/$PROTOC_ZIP \ 
    && sudo unzip -o $PROTOC_ZIP -d /usr/local bin/protoc \
    && sudo unzip -o $PROTOC_ZIP -d /usr/local include/* \
    && rm -f $PROTOC_ZIP

RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
RUN go get -u github.com/golang/protobuf/protoc-gen-go
