FROM ricog/php-fpm
MAINTAINER Rick Guyer <ricoguyer@gmail.com>

RUN sed -i '/upload_max_filesize /c upload_max_filesize = 20M' /etc/php5/fpm/php.ini
RUN sed -i '/post_max_size /c post_max_size = 20M' /etc/php5/fpm/php.ini

COPY wordpress/ /var/www/
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php5-fpm"]
