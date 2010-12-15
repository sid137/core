# VIM Configuration files


## Installation

download repository

    cd ~/
    git clone --recursive git://github.com/sid137/.vim.git

Create a symlink to .vimrc file
    
    ln -s ~/.vim/vimrc ~/.vimrc




## Features


Plugins loaded from .vim/bundle directory with Pathogen
([vim.org](http://www.vim.org/scripts/script.php?script_id=2332))
([github](http://github.com/tpope/vim-pathogen))


*   Surround Plugin ([vim.org](http://www.vim.org/scripts/script.php?script_id=1697))
    ([github](http://github.com/tpope/vim-surround))

*   Snipmate 
    ([vim.org](http://www.vim.org/scripts/script.php?script_id=2540))
    ([github](http://github.com/msanders/snipmate.vim))

*   Snipmate Extrra Snippets
    ([github](git://github.com/scrooloose/snipmate-snippets.git))

*   Rails
    ([vim.org](http://www.vim.org/scripts/script.php?script_id=1567))
    ([github](http://github.com/tpope/vim-rails))

*   Command-T
    ([vim.org](http://www.vim.org/scripts/script.php?script_id=3025)
    [git](git://git.wincent.com/command-t.git))


### General Settings

* Text wrapped to 80 character lines
  
* 1000 line history and undo

* Tab stop at 4 spaces

* Tabs are converted to spaces

* Current line is highlighted

* Mouse enabled for all modes


### Key Mappings  (subject to change)

* Leader key mapped to 
  
    `,`


* Fast saving in Insert and Normal mode

    `,w`


* Easily edit the .vimrc from Insert mode

    `,e`


* Return to Normal mode from Insert mode

    `jk`    or  `,,`

* Reload the .vimrc file from Normal mode

    `,sv`

* Turn ; into : in Normal mode


* Clean highlighted searches from Normal mode

    `,/`


* Save file with sudo priviledges

    `w!!`


* Close current buffer

    `,bd`


* Close all buffers

    `,ba`


* Switch between buffers using left and right arrow keys

    
* Smart way to move btw. windows

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


### Autocommands

* .vimrc automatically reloaded when edited from VIM


* Run script with F5 key when shebbang is present


### Ruby mappings

* Bind control-l to hashrocket =>

* convert word into ruby symbol
    
    `<C-k> <C-o>`

   
    inoremap <buffer> [[ ?def <CR>
    inoremap <buffer> ]] /def <CR>

    nmap <buffer> [[ ?def <CR>
    nmap <buffer> ]] /def <CR>

    inoremap <buffer> ; :
    inoremap <buffer> ;; ;
    inoremap <buffer> 2 "
    inoremap <buffer> 22 2
    imap <buffer> 9 (
    inoremap <buffer> 99 9
    imap <buffer> 0 )
    inoremap <buffer> 00 0
    inoremap <buffer> \ |
    inoremap <buffer> \\ \
    inoremap <buffer> ;; ;

### Nerdtree Plugin 

* Toggle Nerdtree

    `,n`

* Close Nerdtree

    `,N`


### CommandT Mappings


* Call Command-T in Insert mode

    `,t`

* Flush/Reload Command-T 

    
    `,y`


### Commenting and Uncommenting blocks for line visual mode (Shift-V)
Load comments.vim for easy commenting

http://www.vim.org/scripts/script.php?script_id=1528



* Comment selected block of text

    `Ctrl-C`   
        
* Uncomment a selected block of text

    `Ctrl-X`



" Use AutoCMD to automaticall create nonexistant directories on save
" http://www.ibm.com/developerworks/linux/library/l-vim-script-5/index.html


### Snipmate

*   Create snippet from buffer Insert or Normal mode

    `,ca  snippet_name`

*	Autoclose snippet buffer on save

*   Snippets use filetype of original bufffer instead of default "snippet"
	filetype, allowing you to use snippets to make snippets

