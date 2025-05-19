# syntax=docker/dockerfile:1

FROM node:lts-alpine AS builder
WORKDIR /src

COPY package.json package-lock.json ./

RUN npm ci

COPY . .
RUN npm run build

FROM node:lts-alpine AS release
WORKDIR /app
COPY --from=builder /src/build ./
EXPOSE 3000
CMD ["node", "."]
