#/bin/bash -x
 

# Editors
ln -sf ~/core/.vim ~/.vim
ln -sf ~/core/.vim/vimrc ~/.vimrc

# Standard Stuff
ln -sf ~/core/bin ~/bin
ln -sf ~/core/lib ~/lib


for file in `ls -A dotfiles` 
do
	ln -sf ~/core/dotfiles/$file ~/$file
done

