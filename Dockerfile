# Build stage
FROM node:21-slim AS builder
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --ignore-scripts
COPY src/ ./src/

# Production stage
FROM node:21-slim
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/src ./src/
EXPOSE 8080

# Create a non-root user
RUN useradd -m appuser
USER appuser

CMD ["node", "src/index.js"]
