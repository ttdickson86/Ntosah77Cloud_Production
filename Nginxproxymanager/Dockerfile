```dockerfile name=Dockerfile
# Use the official Nginx Proxy Manager image
FROM jc21/nginx-proxy-manager:latest

# Expose ports: 80 (HTTP), 81 (Admin UI), 443 (HTTPS)
EXPOSE 80 81 443

# Healthcheck to validate the container is running
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 CMD curl --fail http://localhost:81 || exit 1

# No additional configuration needed, as the official image is self-contained
# For persistent storage, make sure to mount volumes for /data and /letsencrypt
#
# Example docker run command:
# docker run -d \
#   --name=nginx-proxy-manager \
#   -p 80:80 -p 81:81 -p 443:443 \
#   -v ./data:/data \
#   -v ./letsencrypt:/etc/letsencrypt \
#   jc21/nginx-proxy-manager:latest
```
This Dockerfile uses the official [jc21/nginx-proxy-manager](https://hub.docker.com/r/jc21/nginx-proxy-manager) image and exposes the necessary ports. For production use, remember to mount persistent volumes for `/data` and `/letsencrypt`. No additional setup is required unless you need customizations.