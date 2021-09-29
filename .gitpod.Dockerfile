FROM gitpod/workspace-postgres

USER gitpod

RUN sudo apt-get update \
    && sudo apt-get install -y apt-utils \
    && rm -rf /var/cache/apk/*

RUN sudo wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && \
    sudo dpkg -i erlang-solutions_2.0_all.deb && \
    sudo apt-get update && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y esl-erlang && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y elixir \
    && rm -rf /var/cache/apk/*

RUN sudo apt-get update \
    && sudo apt-get install -y build-essential \
    && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y inotify-tools \
    && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs \
    && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y npm \
    && sudo DEBIAN_FRONTEND=noninteractive npm install npm -g --no-progress

RUN mix do local.hex --force, local.rebar --force, archive.install --force hex phx_new 1.5.13

# Cache elixir deps
ADD mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

# Same with npm deps
#ADD assets/package.json assets/
#RUN cd assets && npm install

ADD . .

# Run frontend build, compile, and digest assets
#RUN cd assets/ && npm run deploy && cd -

RUN mix do compile
