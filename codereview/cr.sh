#!/bin/bash
msg=$1
files=${@:2}
echo "msg: $msg"
echo "files: $files"

WD=$(pwd)
dir=$2

source .cr_conf
[[ X$dir = X ]] && dir='.';

eagle=$WD/eagle
upload=$WD/upload

if [ X"$msg" = X ];then
    echo 'no commit msg'
    echo 'usage: ./auto_cr.sh "commit msg"'
    exit 1
fi
function check_result() {
    if [ $? -ne 0 ];then
        echo "==> $1 failed"
        exit 1
    fi
    echo "==> $1 done"
}

python $eagle $files
ret=$?
if [[ $ret != 0 ]] && [[ $ret != 255 ]];then
    echo '==> check code style failed'
    exit 1
fi
echo '==> check code style done'

# cd $dir
# issue=`echo -e "y\n\$msg\n" | python $upload  | grep -oP '\d{7}$'`
# cd $WD
# get svn username
username=`grep username ~/.subversion/auth/svn.simple/* --after-context=2 | tail -1 | awk -F- '{print $2}'`
[[ -z "$username" ]] && username=`grep username ~/.subversion/auth/svn.simple/* --after-context=2 | tail -1 | awk -F- '{print $1}'`
[[ ! -z "$username" ]]
check_result 'get svn username'
# mentor
mentor=`eval echo '$'$username`
[[ ! -z "$mentor" ]] && reviews="$mentor,$reviews"
# create cooder
$upload -y -m "$msg" -r $reviews $files
check_result 'create code review'
issue=`$upload --find | grep -ohP '\d{5,10}'`
if [ X$mode = X1 ];then
    exit 
fi
svn ci -m "ISSUE=$issue $msg" $files
check_result 'svn commit'
