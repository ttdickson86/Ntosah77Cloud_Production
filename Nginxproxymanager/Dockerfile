
# Dockerfile to build Nginx Proxy Manager from source

# Use Node.js for building the frontend assets
FROM node:18-alpine AS build-frontend

WORKDIR /app

# Clone the official Nginx Proxy Manager repo
RUN apk add --no-cache git && \
    git clone --depth=1 https://github.com/NginxProxyManager/nginx-proxy-manager.git . && \
    cd frontend && \
    npm ci && \
    npm run build

# Stage 2: Use a base image with nginx, certbot, and dependencies for the backend
FROM 'jc21/nginx-proxy-manager:latest'
# Set working directory
WORKDIR /app

# Copy built frontend from previous stage
COPY --from=build-frontend /app/frontend/dist ./frontend/dist

# Copy the rest of the app source code
COPY --from=build-frontend /app/backend ./backend
COPY --from=build-frontend /app/global ./global
COPY --from=build-frontend /app/nginx ./nginx
COPY --from=build-frontend /app/docker/rootfs /app/docker/rootfs
COPY --from=build-frontend /app/package.json ./package.json
COPY --from=build-frontend /app/package-lock.json ./package-lock.json

# Install backend dependencies
RUN cd backend && npm ci --production

# Expose required ports
EXPOSE 80 81 443

# Healthcheck (optional)
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 CMD curl --fail http://localhost:81 || exit 1

# Set default command
CMD ["/app/docker/rootfs/start.sh"]


#**Notes:**
# This Dockerfile builds Nginx Proxy Manager from source, including the frontend assets.
# It uses a multi-stage build for a smaller final image.
# Make sure you have access to the `jc21/nginx-proxy-manager-base:latest` image. If not, you may need to build a base image with all necessary dependencies as in the [official repo's Dockerfile](https://github.com/NginxProxyManager/nginx-proxy-manager/blob/develop/Dockerfile).
# For persistent storage, mount volumes for `/data` and `/etc/letsencrypt` when running the container.
# Adjust the Node.js version or base images as needed for your environment.