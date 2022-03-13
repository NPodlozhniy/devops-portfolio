#!/bin/bash

# commands for working demonstartion
docker network create myapp
# build all from docker-compose
docker-compose up

# working with created db within psql (need to run in another console)
# docker run -it --rm --network myapp -e PGPASSWORD=db-password postgres:10.13-alpine psql -h myapp-db -p 5432 -U db-user

# run app without container with database launched from container (your host internal port there)
# install dependencies outside of docker
# cd app-with-db/app
# pip install -r requirements.txt
# DB_URL=postgres://db-user:db-password@127.0.0.1:60225/myapp python main.py

# run both services without docker-compose (your external host there, 5432 default)
# cd app-with-db/app
# docker build -f Dockerfile -t myapp .
# docker run -it --rm --network myapp -e "DB_URL=postgres://db-user:db-password@myapp-db:5432/myapp" myapp