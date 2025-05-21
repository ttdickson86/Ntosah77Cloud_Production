# ====== Build Stage ======
FROM node:18-alpine AS build

WORKDIR /app

# Install dependencies for building NPM
RUN apk add --no-cache git python3 make g++

# Clone Nginx Proxy Manager source code
RUN git clone --depth=1 https://github.com/NginxProxyManager/nginx-proxy-manager.git .

# Install dependencies and build frontend
WORKDIR /app/frontend
RUN yarn install --frozen-lockfile && yarn build

# ====== Final Stage ======
FROM nginx:alpine

LABEL maintainer="Nginx Proxy Manager Community"

# Install runtime dependencies
RUN apk add --no-cache nodejs npm bash sqlite sqlite-libs curl

# Create app directories
WORKDIR /app

# Copy built application from build stage
COPY --from=build /app /app

# Copy default configuration files
COPY --from=build /app/docker/rootfs/ /

# Expose ports
EXPOSE 80 81 443

# Healthcheck to validate the container is running
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 CMD curl --fail http://localhost:81 || exit 1

# Run Nginx Proxy Manager
CMD ["/init"]