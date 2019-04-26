# dmp-golang-ci image
FROM circleci/golang:1.12

# Install ksonnet 
RUN go get -d -u -v github.com/ksonnet/kubecfg

# Install gorunpkg
RUN go get github.com/vektah/gorunpkg

# Install junit
RUN go get -v github.com/jstemmer/go-junit-report

# Install golangci-lint
RUN go get -d -u -v github.com/golangci/golangci-lint/cmd/golangci-lint
