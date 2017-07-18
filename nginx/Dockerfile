FROM nginx
MAINTAINER JeriChen<jeri.chen0110@gmail.com>

ENV TZ=Asia/Taipei

RUN apt-get update; apt-get install -y openssl; apt-get install -y vim

ADD ./nginx.conf /etc/nginx/
ADD ./nginx/sites /etc/nginx/sites-available

RUN rm /etc/nginx/conf.d/default.conf

# ssl create
ADD ./scripts/run-ssl.sh /etc/nginx/sh/run-ssl.sh
RUN chmod a+x /etc/nginx/sh/run-ssl.sh
RUN /etc/nginx/sh/run-ssl.sh

# ENTRYPOINT ["/etc/nginx/sh/run-ssl.sh"]
# CMD ["nginx", "-g", "daemon on;"]
 
