FROM nginx:1.26.0

COPY keys/nginx-new.crt /etc/nginx/ssl/nginx.crt
COPY keys/nginx-new.key /etc/nginx/ssl/nginx.key
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
