
10 04 * * * /shell/mongobak 1>/log/crontab_mongo_back.file &
10 02 * * * /shell/mongobakdelete 1>/log/crontab_mongo_delete.file &