#FROM nginx:1.10.1-alpine
FROM 'jc21/nginx-proxy-manager:latest'
COPY index.html /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]