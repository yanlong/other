#!/bin/bash
sourcepath=''
targetpath='/var/backup/mongobak'
nowtime=$(date +%Y%m%d)
dbname='test'
 
start()
{
  mongodump --host 127.0.0.1 --port 27017 --out ${targetpath}/${nowtime} --db ${dbname}
}
execute()
{
  start
  if [ $? -eq 0 ]
  then
    echo "back successfully!"
  else
    echo "back failure!"
  fi
}
 
if [ ! -d "${targetpath}/${nowtime}/" ]
then
 mkdir -p ${targetpath}/${nowtime}
fi
execute
echo "============== back end ${nowtime} =============="
