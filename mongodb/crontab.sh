40 19 * * * /root/other/mongodb/backup.sh 1>/var/log/crontab_mongo_back.file &
43 19 * * * /root/other/mongodb/restore.sh 1>/var/log/crontab_mongo_delete.file &
