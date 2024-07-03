# Usa una base image di nginx
FROM nginx:alpine

# Copia il contenuto della directory All nel container
COPY ./All /usr/share/nginx/All
