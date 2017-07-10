FROM nginx
MAINTAINER JeriChen<jeri.chen0110@gmail.com>

ENV TZ=Asia/Taipei
ADD ./nginx.conf /etc/nginx/

# COPY in certs
COPY ssl.crt /etc/nginx/ssl.crt
COPY ssl.key /etc/nginx/ssl.key

RUN rm /etc/nginx/conf.d/default.conf

