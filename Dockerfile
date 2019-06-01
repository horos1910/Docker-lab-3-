FROM nginx
RUN mkdir -p /var/www/Fedor.com/images
COPY ./img.jpg /var/www/Fedor.com/images
ADD img.jpg /var/www/Fedor.com/images
RUN chmod -R 754 /var/www/Fedor.com && \
useradd Fedor && \
groupadd Trof
RUN usermod -aG Trof Fedor  && \
chown -R Fedor:Trof /var/www/Fedor.com && \ 
sed -i 's#/usr/share/nginx/html#/var/www/Fedor.com#g' /etc/nginx/conf.d/default.conf &&\
sed -i 's/user  nginx/user Fedor/g' /etc/nginx/nginx.conf
COPY ./index.html /var/www/Fedor.com 
