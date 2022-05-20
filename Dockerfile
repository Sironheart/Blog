FROM node:fermium-buster-slim AS builder
ADD . /eleventy
WORKDIR /eleventy
RUN npm i && npm run build

FROM nginx:1.21.6-alpine
COPY --from=builder /eleventy/_site /usr/share/nginx/html