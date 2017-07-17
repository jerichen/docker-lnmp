FROM nginx
MAINTAINER JeriChen<jeri.chen0110@gmail.com>

ENV TZ=Asia/Taipei

RUN apt-get update; apt-get install -y openssl

ADD ./nginx.conf /etc/nginx/

RUN rm /etc/nginx/conf.d/default.conf

# openssl create
ADD ./scripts/after.sh /bin/sh/after.sh
RUN chmod a+x /bin/sh/after.sh

ENTRYPOINT ["/bin/sh/after.sh"]
CMD ["nginx", "-g", "daemon on;"]
 
