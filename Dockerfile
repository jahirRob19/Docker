<<<<<<< HEAD
#syntax=docker/dockerfile:1

# builder installs dependencies and builds the node app
FROM node:lts-alpine AS builder
WORKDIR /src
RUN --mount=src=package.json,target=package.json \
    --mount=src=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
    npm ci
COPY . .
RUN --mount=type=cache,target=/root/.npm \
    npm run build

# release creates the runtime image
FROM node:lts-alpine AS release
WORKDIR /app
COPY --from=builder /src/build .
EXPOSE 3000
CMD ["node", "."]
=======
# syntax=docker/dockerfile:1

# 🔧 Etapa 1: Builder - instala dependencias y construye la app
FROM node:lts-alpine AS builder
WORKDIR /src

# Copiar archivos necesarios para instalar dependencias
COPY package.json package-lock.json ./

# 🧪 Etapa 2: Test - corre las pruebas unitarias
FROM node:lts-alpine AS test
WORKDIR /test
>>>>>>> 56fc7ca50928c5695b9926dc53084eda604f2457
