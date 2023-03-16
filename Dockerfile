FROM node:current-slim AS builder
ARG TORCHLIGHT_TOKEN
ENV TORCHLIGHT_TOKEN=$TORCHLIGHT_TOKEN
RUN apt-get update && \
        apt-get install -y \
          chromium \
          nginx
ADD . /eleventy
WORKDIR /eleventy
RUN npm ci && npm run build
RUN rm -rf /var/www/html && ln -s /eleventy/_site /var/www/html && nginx -g "daemon on;" && node ./compile-images.js && kill -QUIT $( cat /run/nginx.pid )

FROM nginx:1.23.3-alpine
COPY --from=builder /eleventy/_site /usr/share/nginx/html