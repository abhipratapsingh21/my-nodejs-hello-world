# Build stage
FROM node:21-slim AS builder
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --ignore-scripts
COPY index.js LICENSE README.md ./

# Production stage
FROM node:21-slim
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app ./

# Create a non-root user
RUN useradd -m appuser
USER appuser

EXPOSE 8080
CMD ["node", "index.js"]
