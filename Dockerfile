FROM node:fermium-buster-slim AS builder
ARG TORCHLIGHT_TOKEN
ADD . /eleventy
WORKDIR /eleventy
ENV TORCHLIGHT_TOKEN=$TORCHLIGHT_TOKEN
RUN npm i && npm run build

FROM nginx:1.21.6-alpine
COPY --from=builder /eleventy/_site /usr/share/nginx/html