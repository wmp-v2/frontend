FROM    docker.io/redhat/ubi9
RUN     curl -fsSL https://rpm.nodesource.com/setup_22.x | bash -
RUN     dnf install -y nodejs nginx
RUN     npm ci && npm run build && rm -rf /usr/share/nginx/html/* && cp -r /app/dist/* /usr/share/nginx/html/



