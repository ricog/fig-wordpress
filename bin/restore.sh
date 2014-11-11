#!/usr/bin/env bash

DIR="$( dirname "$( cd -P "$( dirname "$0" )" && pwd )" )"
PROJECT="$( basename "$DIR" )"
STAMP="$1"

if [ -z $STAMP ]; then
	BACKUP_SQL=$( ls -t $DIR/backups/wordpress_*.sql 2>/dev/null | head -1 )
	if [ -z $BACKUP_SQL ]; then
		echo 'There are no backups to restore';
		exit
	fi

	STAMP=$( basename $BACKUP_SQL )
	STAMP=${STAMP/#wordpress_/}
	STAMP=${STAMP/%.sql/}
fi

MYSQL="${PROJECT}_mysql_1"
PHP="${PROJECT}_fpm_1"

# position files
rm -r $DIR/php/wordpress 2>/dev/null; cp -r $DIR/backups/wordpress_${STAMP} $DIR/php/wordpress

# position sql
cp $DIR/backups/wordpress_${STAMP}.sql $DIR/mysqlinit/database.sql

# rebuild and deploy
#TODO - make this non-destructive (up then drop old ones)
cd $DIR;
fig stop; fig rm --force && fig build --no-cache && fig up -d

