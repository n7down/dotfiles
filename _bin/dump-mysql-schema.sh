#!/bin/bash

[ $# -lt 3 ] && echo "Usage: $(basename $0) <DB_HOST> <DB_USER> <DB_NAME> [<DIR>]" && exit 1

DB_host=$1
DB_user=$2
DB=$3
DIR=$4

[ -n "$DIR" ] || DIR=.
test -d $DIR || mkdir -p $DIR

echo -n "DB password: "
read -s DB_pass
echo
echo "Dumping schema into separate SQL command files for database '$DB' into dir=$DIR"

#tbl_count=0

#for t in $(mysql -NBA -h $DB_host -u $DB_user -p$DB_pass -D $DB -e 'show tables')
#do
	#echo "DUMPING TABLE: $DB.$t"
	#mysqldump -h $DB_host -u $DB_user -p$DB_pass $DB $t > $DIR/$t.sql 
	#tbl_count=$(( tbl_count + 1 ))
#done

mysqldump -h $DB_host -u $DB_user -p$DB_pass --no-data $DB > $DIR/schema.sql

echo "Schema dumped from database '$DB' into dir=$DIR"
