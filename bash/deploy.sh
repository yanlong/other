#!/bin/bash
bash_file=~/.bashrc
if [ -f ~/.bash_profile ];then
  bash_file=~/.bash_profile
fi
cat bashrc >> $bash_file

