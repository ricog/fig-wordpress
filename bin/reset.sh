#!/usr/bin/env bash

DIR="$( dirname "$( cd -P "$( dirname "$0" )" && pwd )" )"

# position files
rm -r $DIR/php/wordpress 2>/dev/null; cp -r $DIR/php/wordpress.base $DIR/php/wordpress

# position sql
echo '' > $DIR/mysqlinit/database.sql

# rebuild and deploy
#TODO - make this non-destructive (up then drop old ones)
cd $DIR;
fig stop; fig rm --force && fig build --no-cache && fig up -d

