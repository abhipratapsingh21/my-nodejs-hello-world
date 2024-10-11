# Build stage
FROM node:21-slim AS builder

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies without running scripts
RUN npm ci --ignore-scripts

# Copy the rest of the application code
COPY . .

# Production stage
FROM node:21-slim

# Set the working directory for the final image
WORKDIR /usr/src/app

# Create a non-root user and group
RUN groupadd -r appgroup && useradd -r -g appgroup appuser

# Copy only the necessary files from the builder stage
COPY --from=builder /usr/src/app ./

# Remove development dependencies
RUN npm prune --production

# Change ownership of the application files
RUN chown -R appuser:appgroup /usr/src/app

# Switch to the non-root user
USER appuser

# Expose the application port
EXPOSE 8080

# Start the application
CMD ["node", "index.js"]
