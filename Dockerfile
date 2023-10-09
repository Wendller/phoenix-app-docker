FROM elixir:1.14-alpine

WORKDIR /app

RUN apk update && \
    mix local.hex --force && \
    mix local.rebar --force && \
    apk add git bash inotify-tools openssl curl alpine-sdk coreutils && \
    mix archive.install --force hex phx_new 

EXPOSE 4000

CMD ["mix", "phx.server"]