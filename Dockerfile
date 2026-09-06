# ---------------------------------------------------------------------
# Node app. If your stack is Python, delete this and rename
# Dockerfile.python to Dockerfile.
# ---------------------------------------------------------------------

# Build stage: installs dev dependencies and compiles.
FROM node:20-slim AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build --if-present

# Runtime stage: production deps only, so the shipped image does not
# contain your build toolchain.
FROM node:20-slim AS runtime
WORKDIR /app
ENV NODE_ENV=production
COPY package*.json ./
RUN npm ci --omit=dev && npm cache clean --force
COPY --from=build /app ./

# Do not run as root. Node images ship a "node" user already.
USER node

EXPOSE 3000
CMD ["node", "server.js"]
