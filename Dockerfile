# Build stage
FROM node:21-slim AS builder

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies (using npm ci for efficiency)
RUN npm ci

# Copy the rest of the application code
COPY . .

# Production stage
FROM node:21-slim

# Set the working directory for the final image
WORKDIR /usr/src/app

# Copy only the necessary files from the builder stage
COPY --from=builder /usr/src/app ./

# Remove development dependencies
RUN npm prune --production

# Expose the application port
EXPOSE 8080

# Start the application
CMD ["node", "index.js"]
