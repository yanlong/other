#!/bin/bash

base_url=http://yanlong.fe.baidu.com/cr
files=(
upload
eagle
cr.sh
.cr_conf
)

for file in ${files[@]};do
    curl $base_url/$file > $file && chmod 755 $file && svn add $file
done
