FROM node:16.20.0-alpine3.18 AS builder
ARG TORCHLIGHT_TOKEN
ENV TORCHLIGHT_TOKEN=$TORCHLIGHT_TOKEN
RUN apk update && apk add --no-cache nmap && \
        echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
        echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
        apk update && \
        apk add --no-cache \
          chromium \
          harfbuzz \
          "freetype>2.8" \
          ttf-freefont \
          nss \
          nginx
ADD . /eleventy
WORKDIR /eleventy
ADD ./build_files/default.conf /etc/nginx/http.d/default.conf
RUN npm ci && npm run build
RUN rm -rf /usr/share/nginx/html && ln -s /eleventy/_site /usr/share/nginx/html && nginx -g "daemon on;" && node ./compile-images.js

FROM nginx:stable-alpine3.17-slim
COPY --from=builder /eleventy/_site /usr/share/nginx/html