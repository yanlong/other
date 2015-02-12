#!/bin/bash

git config --global alias.st status
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.di diff
git config --global alias.log1 'log --graph --abbrev-commit --decorate --date=relative --all' --replace-all
git config --global alias.log2 'log --graph --oneline --decorate --date=relative --all' --replace-all



