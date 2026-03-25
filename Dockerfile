FROM nginx:1.29.6-alpine

RUN rm /etc/nginx/conf.d/default.conf /etc/nginx/nginx.conf
RUN apk add tzdata
ENV TZ=Europe/Moscow

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html

RUN chown -R nginx:nginx /var/cache/nginx /var/log/nginx /usr/share/nginx/html /etc/nginx

USER nginx
CMD ["nginx", "-g", "daemon off;"]