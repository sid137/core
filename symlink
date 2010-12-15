#/bin/bash -x
 
# Testing icons
ln -sf ~/core/pass.png ~/pass.png
ln -sf ~/core/fail.png ~/fail.png

# Editors
ln -sf ~/core/.emacs.d ~/.emacs.d
ln -sf ~/core/.vim ~/.vim
ln -sf ~/core/.vim/vimrc ~/.vimrc

# Standard Stuff
ln -sf ~/core/bin ~/bin
ln -sf ~/core/lib ~/lib

ln -sf ~/core/compiz/config ~/.config/compiz/compizconfig/config
ln -sf ~/core/compiz/Default.ini ~/.config/compiz/compizconfig/Default.ini



for file in `ls -A dotfiles` 
do
	ln -sf ~/core/dotfiles/$file ~/$file
done

#Flash cache - map crap to /tmp so its erased on reboot
ln -s /tmp ~/.macromedia 
ln -s /tmp ~/.adobe
./autostart/link_autostart
