#!/bin/bash

# check result of last command
function check_result() {
    if [ ! $? -eq 0 ];then
        echo "==>$1 failed!"
        exit 1
    fi
    echo "==>$1 done"
    return 0
}
