FROM mileschou/phalcon:7.2-fpm

RUN echo  "deb http://mirrors.163.com/debian/ stretch main non-free contrib" > /etc/apt/sources.list && \
    echo  "deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list && \
    echo  "deb http://mirrors.163.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list && \
    echo  "deb-src http://mirrors.163.com/debian/ stretch main non-free contrib" >> /etc/apt/sources.list && \
    echo  "deb-src http://mirrors.163.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list && \
    echo  "deb-src http://mirrors.163.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list && \
    echo  "deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib" >> /etc/apt/sources.list && \
    echo  "deb-src http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib" >> /etc/apt/sources.list && \
    apt update && \
    apt install -y zlib1g-dev vim supervisor libmcrypt-dev libpng-dev libxml2-dev libxslt1-dev libffi-dev libfreetype6-dev libjpeg-dev libcurl4-openssl-dev libssl-dev nginx

RUN docker-php-ext-configure gd \
         --with-gd \
         --with-freetype-dir=/usr/include/ \
         --with-png-dir=/usr/include/ \
         --with-jpeg-dir=/usr/include/ && \
       docker-php-ext-install pdo_mysql mysqli gd exif xsl json soap dom zip sockets && \
       docker-php-source delete

RUN apt install -y apt-transport-https gnupg wget && curl https://packages.microsoft.com/keys/microsoft.asc |  apt-key add - && \
	curl https://packages.microsoft.com/config/debian/9/prod.list |  tee /etc/apt/sources.list.d/mssql-tools.list && \
	apt-get update && \
	ACCEPT_EULA=Y apt-get install -y mssql-tools  --allow-unauthenticated && \
	apt-get install -y unixodbc-dev --allow-unauthenticated && \
	pecl install sqlsrv pdo_sqlsrv && \
	echo "extension= pdo_sqlsrv.so" > /usr/local/etc/php/conf.d/mssql.ini && \
	echo "extension= sqlsrv.so" >> /usr/local/etc/php/conf.d/mssql.ini 

WORKDIR /var/www/html/
COPY docker ./docker

RUN sed -i \
        -e "s/;catch_workers_output\s*=\s*yes/catch_workers_output = yes/g" \
        -e "s/pm.max_children = 5/pm.max_children = 100/g" \
        -e "s/pm.start_servers = 2/pm.start_servers = 3/g" \
        -e "s/pm.min_spare_servers = 1/pm.min_spare_servers = 2/g" \
        -e "s/pm.max_spare_servers = 3/pm.max_spare_servers = 4/g" \
        -e "s/;pm.max_requests = 500/pm.max_requests = 200/g" \
        -e "s/;listen.mode = 0660/listen.mode = 0666/g" \
        -e "s/^;clear_env = no$/clear_env = no/" \
    /usr/local/etc/php-fpm.d/www.conf  \
    &&  cd /var/www/html/  \
    && cp -f docker/nginx.conf /etc/nginx/nginx.conf   \
    && cp -f docker/nginx-site.conf /etc/nginx/conf.d/default.conf \
    && cp -f docker/php.ini /usr/local/etc/php/conf.d/php.ini \
    && cp -rf docker/s6 /etc/  \
    && chmod +x /etc/s6/nginx/run  \
    && chmod +x /etc/s6/php-fpm/run 

EXPOSE 80

ADD docker/supervisord.conf /etc/supervisord.conf
COPY conf ./conf
COPY public ./public
COPY var ./var
COPY xin ./xin
RUN  mkdir -p /var/www/html/var/logs && chown www-data:www-data -R ./ 

CMD ["/usr/bin/supervisord","-n","-c", "/etc/supervisord.conf"]