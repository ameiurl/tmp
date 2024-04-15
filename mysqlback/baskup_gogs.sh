#!/bin/bash

. /etc/profile

DIR=/var/lib/mysql/backup
if [ ! -e $DIR ]
then
/bin/mkdir -p $DIR
fi
NOWDATE=$(date +%Y%m%d%H%M%S)
/usr/bin/mysqldump -u root -proot gogs > "$DIR/data_gogs_$NOWDATE.sql"

/usr/bin/find $DIR -mtime +7 -name "data_gogs_[1-9]*.sql" -exec rm -rf {} \;
