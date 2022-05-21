FROM node:alpine3.14 AS builder
ARG TORCHLIGHT_TOKEN
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
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
          nss
ADD . /eleventy
WORKDIR /eleventy
RUN npm i && npm run build
RUN node ./compile-images.js

FROM nginx:1.21.6-alpine
COPY --from=builder /eleventy/_site /usr/share/nginx/html