#!/bin/sh

sudo podman stop plexrequest-pg
sudo podman rm plexrequest-pg
sudo podman run -d --name plexrequest-pg -e POSTGRES_USER=use -e POSTGRES_USER=user -e POSTGRES_PASSWORD=password -p 5432:5432 postgres
sleep 10
sudo podman exec -it plexrequest-pg psql -U user -c 'CREATE DATABASE plex_request_dev;'
