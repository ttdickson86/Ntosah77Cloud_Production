docker build -t ntosah77-nginxproxy:latest .
docker push ttdickson86/ntosah77portainer:tagname
docker run -d --name ccf11a8ffd9c -p 8080:80 ntosah77-nginxproxy:latest

Link: https://medium.com/nerd-for-tech/deploy-a-custom-nginx-docker-image-and-push-it-to-docker-hub-118f1ab2186b