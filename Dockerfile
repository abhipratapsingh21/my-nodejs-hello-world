# Build stage
FROM node:21-slim AS builder
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .

# Production stage
FROM node:21-slim
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app ./
RUN npm prune --production
EXPOSE 8080
CMD ["node", "index.js"]
