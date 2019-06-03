FROM postgres:latest
COPY data.sql /docker-entrypoint-initdb.d/