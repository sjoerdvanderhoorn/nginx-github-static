FROM nginx:stable-alpine

ENV REPOSITORY_URL https://github.com/github/government.github.com.git

RUN apk add --no-cache git
RUN apk add --update npm

WORKDIR /usr/share/nginx/html/

EXPOSE 80
STOPSIGNAL SIGTERM
CMD rm -rf /usr/share/nginx/html/* && \
    git clone ${REPOSITORY_URL} /usr/share/nginx/html/ && \ 
    npm install /usr/share/nginx/html/ && \
    nginx -g "daemon off;"
