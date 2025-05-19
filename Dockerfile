# syntax=docker/dockerfile:1

# 🔧 Etapa 1: Builder - instala dependencias y construye la app
FROM node:lts-alpine AS builder
WORKDIR /src

# Copiar archivos necesarios para instalar dependencias
COPY package.json package-lock.json ./

# Cacheo de npm para acelerar builds
RUN --mount=type=cache,target=/root/.npm npm ci

# Copia el resto del código fuente
COPY . .

# Construcción de la app
RUN --mount=type=cache,target=/root/.npm npm run build

# 🧪 Etapa 2: Test - corre pruebas unitarias con cobertura
FROM node:lts-alpine AS test
WORKDIR /app

# Copiar dependencias y código
COPY package.json package-lock.json ./
RUN npm ci
COPY . .

# Ejecuta pruebas (ideal con cobertura)
RUN npm run test

# 🚀 Etapa 3: Release - imagen liviana de ejecución
FROM node:lts-alpine AS release
WORKDIR /app

# Copia solo los archivos construidos
COPY --from=builder /src/build ./

# Puerto que expone la app
EXPOSE 3000

# Comando de ejecución
CMD ["node", "."]
