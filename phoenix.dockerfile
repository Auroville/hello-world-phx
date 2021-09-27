FROM elixir:1.12

USER root

RUN apt-get update
RUN apt-get install -y inotify-tools
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN npm install npm -g --no-progress
RUN update-ca-certificates --fresh
RUN rm -rf /var/cache/apk/*

ONBUILD RUN mix do local.hex --force, local.rebar --force

CMD ["bash"]
