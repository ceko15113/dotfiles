#!/bin/sh

git clone https://github.com/ceko15113/dotfiles.git .dotfiles

# . と .. 以外のドットファイル
for f in .??*
do
	# 除外するファイル、ディレクトリのリスト
	[ $f == '.DS_Store' ] && continue
	[ $f == '.git' ] && continue

	# シンボリックリンクを作成
	# ln は BSD と GNU で実装が異なり、ターゲットと元ファイルの
	# 引数の順序が逆である
	if [ `uname` == 'Darwin' ]; then
		ln -s ~/$f ~/.dotfiles/$f
	else
		ln -s ~/.dotfiles/$f ~/$f
	fi
done

#ln ~/.zshrc ~/.dotfiles/.zshrc
#ln ~/.vimrc ~/.dotfiles/.vimrc
