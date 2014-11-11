#!/usr/bin/env bash

DIR="$( dirname "$( cd -P "$( dirname "$0" )" && pwd )" )"

rm -r $DIR/php/wordpress
rm -r $DIR/php/wordpress.base
cd php
curl https://wordpress.org/latest.tar.gz | tar -xvzf -
cp -r $DIR/php/wordpress $DIR/php/wordpress.base
echo '' > $DIR/mysqlinit/database.sql
