#!/bin/bash

#set gitpod environment variables (scope is project). These are default values.

gp env PGHOSTADDR="127.0.0.1"
gp env PGDATABASE="hello_world_dev"
gp env PGDATA="/workspace/.pgsql/data"
gp env PGHOST="localhost"
gp env PGPORT="5432"
gp env PGUSER="gitpod"

#secrets
gp env SECRET_KEY_BASE="N5tC9rMlM2ETJ2U8HFYXF8vdeBrLp6sDjNMtmnxxz350nAugLFbaFkemAUdWsscW"
gp env PGPASSWORD="postgres"

gp env DATABASE_URL="postgresql://{$PGUSER}:{$PGPASSWORD}@{$PGHOST}:{$PGPORT}/{$PGDATABASE}"
