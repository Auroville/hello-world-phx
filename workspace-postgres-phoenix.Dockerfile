FROM almajumdar/workspace-postgres-elixir

USER root
RUN wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && \
    dpkg -i erlang-solutions_2.0_all.deb && \
    apt-get update && \
    apt-get install -y esl-erlang && \
    apt-get install -y elixir
