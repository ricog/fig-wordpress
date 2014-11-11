#!/usr/bin/env bash

DIR="$( dirname "$( cd -P "$( dirname "$0" )" && pwd )" )"
PROJECT="$( basename "$DIR" )";

i="1"
STAMP_PREFIX=$(date +%Y-%m-%d-)
STAMP="$STAMP_PREFIX$i"
while [ -f "$DIR/backups/wordpress_${STAMP}.sql" ]
do
i=$[$i+1]
STAMP="$STAMP_PREFIX$i"
done

MYSQL="${PROJECT}_mysql_1"
PHP="${PROJECT}_fpm_1"

docker exec $MYSQL  mysqldump --skip-comments --password="password" wordpress > $DIR/backups/wordpress_${STAMP}.sql

docker exec $PHP tar -czf - /var/www | tar zxv && mv $DIR/var/www $DIR/backups/wordpress_${STAMP} && rmdir $DIR/var
