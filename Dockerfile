FROM nginx:stable-alpine-slim
COPY ./build/web /usr/share/nginx/html
