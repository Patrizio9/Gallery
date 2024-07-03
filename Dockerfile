# Usa una base image di nginx
FROM nginx:alpine

# Copia il contenuto delle directory nella directory corrispondente nel container
COPY ./DC /usr/share/nginx/html/DC
COPY ./FantasySwords /usr/share/nginx/html/FantasySwords
COPY ./Misc /usr/share/nginx/html/Misc
COPY ./Sonic /usr/share/nginx/html/Sonic
COPY ./WorldOfHeroes /usr/share/nginx/html/WorldOfHeroes
