#!/bin/bash
sourcepath=''
targetpath='/home/work/data/backup/mongobak'
nowtime=$(date +%Y%m%d)
databases=('zhihu')
port=8100
days=7
backup() {
    for db in ${databases[@]}
    do
        mongodump --host 127.0.0.1 --port $port --out ${targetpath}/${nowtime} --db ${db}
    done
}

cleanup() {
    start_time=$(date -d "-$days days" +%Y%m%d)
    rm -rf ${targetpath}/$start_time
}

if [ ! -d "${targetpath}/${nowtime}/" ];then
    mkdir -p ${targetpath}/${nowtime}
fi
cmd='cleanup'
[[ ! -z "$1" ]] && cmd=$1
$cmd
if [[ $? -eq 0 ]];then
    echo "==> $cmd done!"
else
    echo "==> $cmd failed!"
fi

