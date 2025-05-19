# syntax=docker/dockerfile:1

# --- 1) stage deps: instala node_modules (incluye dev) ---
FROM node:lts-alpine AS deps
WORKDIR /src
COPY package*.json ./
RUN npm ci

# --- 2) stage test: ejecuta tus tests con cobertura ---
FROM deps AS test
# copia todo el código fuente
COPY . .
# al iniciarse, corre Vitest + cobertura
CMD ["npm", "run", "test"]

# --- 3) stage build: genera tus assets de producción ---
FROM deps AS builder
COPY . .
RUN npm run build

# --- 4) stage release: imagen ligera para servir tu app ---
FROM node:lts-alpine AS release
WORKDIR /app
# sólo tomo los ficheros ya compilados
COPY --from=builder /src/build .  
EXPOSE 3000
CMD ["node", "."]
