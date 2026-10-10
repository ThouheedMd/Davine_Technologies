# Lightweight base image
FROM node:20-alpine

# Working directory inside the container
WORKDIR /app

# Copy dependency files first to use Docker layer caching
COPY package*.json ./
RUN npm install --omit=dev

# Copy application source
COPY . .

# Default environment values (can be overridden at runtime)
ENV PORT=3000 APP_ENV=production DATA_DIR=/data

# Persistent data location
VOLUME ["/data"]

# Document the port the app listens on
EXPOSE 3000

# Run as the non-root user provided by the node image
USER node

CMD ["node", "server.js"]