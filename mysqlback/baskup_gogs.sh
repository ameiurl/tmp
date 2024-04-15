#!/bin/bash
docker exec mydb mysqldump -uroot -proot gogs | gzip > /home/amei/mysql/gogs_`date +%Y%m%d`.sql.gz
send=`date '+%Y-%m-%d %H:%M:%S'`
if [ $? -ne 0 ];
then
    echo "$send 数据备份失败"
    exit -1
else
    echo "$send 数据备份成功！"
fi
 
find /home/amei/mysql/ -mtime +7 -name 'gogs_[1-9].sql' -exec rm -rf {} \;
