#!/bin/bash

DB_DIR=$(cd $(dirname $0) && pwd)
cd $DB_DIR

# mysql -uisucon  -pisucon -h 172.31.42.224 -e "DROP DATABASE IF EXISTS isubata; CREATE DATABASE isubata;"
# mysql -uisucon  -pisucon -h 172.31.42.224 isubata < ./isubata.sql
# zcat isucon7q-initial-dataset.sql.gz | mysql -uisucon  -pisucon -h 172.31.42.224 --default-character-set=utf8mb4
mysql -uisucon  -pisucon -h 172.31.39.102 isubata < index.sql
