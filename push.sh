#!/bin/bash
#
#**************************************************
# Author:         WUKING                          *
# E-mail:         wuying283@hotmail.com           *
# Date:           2023-08-14                      *
# Description:                                    *
# Copyright 2023 by WUKING.All Rights Reserved    *
#**************************************************

cd ~/myWeb/dotfiles && git checkout master && rsync -avzP --progress --delete --exclude '%Users*' ~/.config/nvim/ ~/myWeb/dotfiles/neovim/

cd ~/myWeb/dotfiles/ || exit 1

find . -name ".DS_Store" -exec rm -f {} \;

echo -e "\n"
read -r -p "同步文件夹完成，是否继续？ [Y/n] " response
response=${response,,} # tolower
if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
	cd ~/myWeb/dotfiles/  || exit 1

	export http_proxy=127.0.0.1:10808
	export https_proxy=127.0.0.1:10808

	lazygit

else
	exit 1
fi

git checkout nvim

rsync -avzP --progress --delete --exclude '%Users*' --exclude '.git/' --exclude 'zsh/' ~/.config/nvim/ ~/myWeb/dotfiles/

find . -name ".DS_Store" -exec rm -f {} \;

lazygit

git checkout master

cd - || exit 2
