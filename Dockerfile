FROM almajumdar/phoenix-pg:1.12

# Create app directory and copy the Elixir projects into it
WORKDIR /app
COPY . .

# Install hex package manager
RUN mix do deps.get, deps.compile

EXPOSE 4000

CMD ["/bin/bash", "/app/entrypoint.sh"]
