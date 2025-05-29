# syntax=docker/dockerfile:1

### 🔧 Etapa 1: Builder
FROM node:lts-alpine AS builder
WORKDIR /src

# Instalar dependencias
COPY package.json package-lock.json ./
RUN npm install

# Copiar el resto del código y construir
COPY . .
RUN npm run build

### 🧪 Etapa 2: Test
FROM node:lts-alpine AS test
WORKDIR /test

# Copiar dependencias y código para pruebas
COPY --from=builder /src /test
RUN npm install
RUN npm run test

### 🚀 Etapa 3: Producción (opcional, si se sirve como app)
# FROM node:lts-alpine AS final
# WORKDIR /app
# COPY --from=builder /src/build /app
# CMD ["npm", "run", "preview"]
