#!/bin/bash

base_url=http://yanlong.fe.baidu.com/cr
files=(
upload
eagle
cr.sh
)

function deploy() {
    file=$1
    curl $base_url/$file > $file && chmod 755 $file && svn add $file
}


for file in ${files[@]};do
    deploy $file
done
[[ ! -e ./.cr_conf ]] && deploy .cr_conf
