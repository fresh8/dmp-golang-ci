# dmp-golang-ci image
FROM circleci/golang:1.15

# Install gorunpkg
RUN go get github.com/vektah/gorunpkg

# Install junit
RUN go get -v github.com/jstemmer/go-junit-report

# Install golangci-lint
RUN go get -d -u -v github.com/golangci/golangci-lint/cmd/golangci-lint

# Protobuf
ENV PROTOC_VER=3.12.4
ENV PROTOC_ZIP=protoc-${PROTOC_VER}-linux-x86_64.zip
RUN curl -OL https://github.com/google/protobuf/releases/download/v${PROTOC_VER}/${PROTOC_ZIP} \ 
    && sudo unzip -o ${PROTOC_ZIP} -d /usr/local bin/protoc \
    && sudo unzip -o ${PROTOC_ZIP} -d /usr/local include/* \
    && rm -f ${PROTOC_ZIP}

RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
RUN go get -u github.com/golang/protobuf/protoc-gen-go

RUN chmod +x /usr/local/bin/protoc

# Install Pact tooling
RUN cd /home/circleci && \
  curl -fsSL https://raw.githubusercontent.com/pact-foundation/pact-ruby-standalone/master/install.sh | sh
ENV PATH="${PATH}:/home/circleci/pact/bin"
