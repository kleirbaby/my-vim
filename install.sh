#!/bin/sh

#该脚本安装的vim配置仅在当前用户目录下生效

mkdir ~/.vim/basic -p
cp ./basic.vim ~/.vim/basic
cp ./vimrc ~/.vimrc

