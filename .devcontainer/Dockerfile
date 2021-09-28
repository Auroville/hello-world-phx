FROM bitwalker/alpine-elixir-phoenix

EXPOSE 4000
ENV PORT=4000 MIX_ENV=prod

WORKDIR /workspace

# Cache elixir deps
COPY mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

# Same with npm deps
COPY assets/package.json assets/
RUN cd assets && \
    npm install

COPY . .

# Run frontend build, compile, and digest assets
RUN cd assets/ && \
    npm run deploy && \
    cd - && \
    mix do compile, phx.digest

USER default
