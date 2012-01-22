#/bin/bash -x
 

# Editors
ln -sf ~/core/.vim ~/.vim
ln -sf ~/core/.vim/vimrc ~/.vimrc

# Standard Stuff
ln -sf ~/core/lib ~/lib


for file in `ls -A ~/core/dotfiles` 
do
	ln -sf ~/core/dotfiles/$file ~/$file
done

