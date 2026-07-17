FROM golang:1.26.4-alpine AS build

WORKDIR /src
ARG SERVICE

COPY go.mod ./
RUN --mount=type=cache,target=/go/pkg/mod \
    go mod download

COPY . .
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /out/app ./services/${SERVICE}

FROM gcr.io/distroless/static
COPY --from=build /out/app /app

ENTRYPOINT ["./app"]