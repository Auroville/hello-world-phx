#!/bin/bash

#set gitpod environment variables (scope is project). These are default values.

gp env DATABASE_URL="postgresql://gitpod@localhost"
gp env PGHOSTADDR="127.0.0.1"
gp env PGDATABASE="postgres"
gp env PGDATA="/workspace/.pgsql/data"

#secrets
gp env SECRET_KEY_BASE=N5tC9rMlM2ETJ2U8HFYXF8vdeBrLp6sDjNMtmnxxz350nAugLFbaFkemAUdWsscW
