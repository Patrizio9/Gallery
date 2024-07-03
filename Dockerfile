# Usa una base image di nginx
FROM nginx:alpine

# Copia il contenuto della directory html nel container
COPY ./Gallery /usr/share/nginx/Gallery