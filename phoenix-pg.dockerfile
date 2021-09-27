FROM almajumdar/phoenix:1.12

RUN apt-get update && \
  apt-get install -y postgresql-client

ONBUILD RUN mix do local.hex --force, local.rebar --force
