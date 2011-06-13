# Some crazy thing to make rpsec2 work 
# http://www.ruby-forum.com/topic/206187
export OMP_NUM_THREADS=4
export RUBYOPT=rubygems
export RUBYLIB=~/lib
export RSPEC=true

export RDOCOPT="-S -f html"
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

export TRACKING=~/tracking
export PATH=$PATH:$HOME/vim/bin
export PATH=$PATH:$HOME/core/installers
export PATH=$HOME/local/node/bin:$PATH
export PATH=$HOME/tracking/go/bin:$PATH
export PATH=$HOME/local/couchdb/bin:$PATH
export PATH=$HOME/local/redis/bin:$PATH
export PATH=$HOME/local/imagemagick/bin:$PATH
export PATH=$PATH:$HOME/local/firefox
export PATH=$PATH:./bin:${PATH//:\.\/bin:} 

# add recursive PATH, taken from 
# http://stackoverflow.com/questions/657108/bash-recursively-adding-subdirectories-to-the-path
export PATH=$PATH:$(find -L ~/bin -type d | sed '/\/\./ d' | tr '\n' ':' | sed 's/:$//')
export PERL5LIB=$PERL5LIB:$PATH

# Eclipse event error
export GDK_NATIVE_WINDOWS=true
export PATH=$PATH:$HOME/android-sdk-linux_86/tools
# Using Rsense code lookup for ruby
# http://github.com/m2ym/rsense/blob/master/doc/manual.txt
export RSENSE_HOME=~/core/ext/rsense


# Amazon IAM Toolkit
export AWS_IAM_HOME=$HOME/local/IAMCli-1.2.0
export PATH=$PATH:$AWS_IAM_HOME/bin

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt autocd 
setopt pushdignoredups
setopt autopushd
setopt rmstarsilent
setopt extended_glob
setopt extended_history
unsetopt beep

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'


export AWS_CREDENTIALS_FILE=~/aws_credentials
export AWS_CREDENTIAL_FILE=~/aws_credentials
. ~/secret_credentials

autoload -Uz compinit
autoload zmv
compinit

. ~/core/git-prompt/git-prompt.sh

#ZLS_COLORS=$LS_COLORS
# End of lines added by compinstalli
export TERM=xterm-color
#PS1=$'%{\e[0;31m%}%{\e[0m%}%{\e[0m%}%{\e[1;34m%}$(prompt_git_info):%{\e[0m%}%{\e[1;32m%}%~%{\e[0m%} $ '
PS1=$'$(prompt_git_info)%{$terminfo[bold]$fg[blue]%}:%{\e[0m%}%{$terminfo[bold]$fg[green]%}%~%{\e[0m%} $ '

# export EDITOR="emacs"
#//cappuccino path
export CAPP_BUILD='/tmp/capp'
export PATH="/home/sid137/narwhal/bin:$PATH"
export EDITOR="vim"
export BOOST_ROOT=/usr/local/boost
export VPS=184.106.153.97
export SAFE=~/core
export ATLAS=/usr/lib/atlas
export JAVA_HOME=/usr/lib/jvm/java-6-sun-1.6.0.16
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk
export EC2_HOME=
export PATH=$PATH:/opt/eagle-5.6.0/bin/
export MAKEFILES=~/Makefile
export DW=ami-3e836657
export src=~/src
export tools=~/src/tools
export data=~/projects/datasets
export gomm='https://gomm.svn.sourceforge.net/svnroot/gomm/trunk'
export simpinst='https://simpinstall.svn.sourceforge.net/svnroot/simpinstall/trunk'
# Make EAGLE PCB not transparent with compiz
export XLIB_SKIP_ARGB_VISUALS=1
#. ~/.zsvn
. ~/.zaliases
#. /opt/Xilinx/10.1/ISE/settings32.sh

export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib:$LD_LIBRARY_PATH

export LD_LIBRARY_PATH=/usr/local/hdf5-1.6/lib:$LD_LIBRARY_PATH

#NVidia CUDA - rm -rf /usr/local/cuda  to uninstall
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export PATH=/usr/local/cuda/bin:$PATH


# Rails Vars
export AUTOFEATURE=true

# KDE
#export KDEHOME=$HOME/core/.kde
export KDEWM="compiz-fusion"
export KDETMP=/tmp
export KDEVARTMP=/tmp

# DISLIN
export DISLIN=/usr/local/dislin
export LD_LIBRARY_PATH=$DISLIN:$LD_LIBRARY_PATH
export PATH=${DISLIN}/bin:$PATH
export PYTHONPATH=~/.ipython:$DISLIN/python


export PATH=~/local/MATLAB/R2010b/bin:$PATH
# Configure firefox so save_and_open_path command in capybara works in launchy
export LAUNCHY_BROWSER=/usr/bin/firefox

# For AMD Stream
#export LD_LIBRARY_PATH=/usr/local/amdcal/lib64/:/usr/local/amdbrook/sdk/lib:$LD_LIBRARY_PATH

# [end of auto-screen snippet]
#
[[ $EMACS = t ]] && unsetopt zle
export XILINX_USB_DEV=005:026
export LREPO=~/projects/templates/

# Text color variables
txtund=$(tput sgr 0 1)     # Underline
txtbld=$(tput bold)        # Bold
txtred=$(tput setaf 1)     # Red
txtgrn=$(tput setaf 2)     # Green
txtylw=$(tput setaf 3)     # Yellow
txtblu=$(tput setaf 4)     # Blue
txtpur=$(tput setaf 5)     # Purple
txtcyn=$(tput setaf 6)     # Cyan
txtwht=$(tput setaf 7)     # White
txtrst=$(tput sgr0)        # Text reset
txtund=$(tput sgr 0 1)           # Underline
txtbld=$(tput bold)              # Bold
bldred=${txtbld}$(tput setaf 1)  #  red
bldblu=${txtbld}$(tput setaf 4)  #  blue
bldwht=${txtbld}$(tput setaf 7)  #  white
bldgrn=${txtbld}${txtgrn}
alert=${bldgrn}
txtrst=$(tput sgr0)              # Reset
info=${bldwht}*${txtrst}         # Feedback
pass=${bldblu}*${txtrst}
warn=${bldred}!${txtrst}

if [[ -s ~/.rvm/scripts/rvm ]] ; then 
	source ~/.rvm/scripts/rvm ; 
fi


# Shortcut to initialize rails apps with templates
function rapp {
    appname=$1
    template=$2
    rails new $appname --skip-gemfile -JTm https://github.com/sid137/rails-templates/raw/master/${template:-rails3}.rb 
}
function rapp-test {
    appname=$1
    template=$2
    rails new $appname --skip-gemfile -JTm ~/tracking/rails-templates/${template:-rails3}.rb 
}

function deploy {
    #get branch name
    #compile sass to css
    #coompile coffescript to java
    #run asseet compression 
    # git commit assets to repo
    # push to current branch server 
}


# Utility script for geveloping ruby gems with rvm
# Kills the gemset, and starts fresh to test a gem
# installation 
function gem_build {
    # Assume that we've created a gemset with the same name as our gem
    gemname=$(basename `pwd`)
    gemset=$gemname
    version=$(cat VERSION)
    gemver=$gemname-$version.gem
    rvm gemset empty $gemset
    gem install bundler --no-ri --no-rdoc
    rake build
    echo "Installing gem $gemver..."
    gem install pkg/$gemver --no-ri --no-rdoc
}

function jew {
    gemname=$1
    opts=$2
    jeweler --rspec --cucumber $gemname $opts
    cd $gemname
    rake version:write
}

# User sqlitebrowser to browse rails test dbs
function sqb {
    sqlitebrowser db/${1:-development}.sqlite3
}

# commit git repo and push to github
function gpm {
    message=$1
    git commit -a -m $message
    git push --all
}

function git-clean-branch {
    branch=$1
    optional_starting_point = $2
    git checkout --orphan $branch $optional_starting_point
    git rm -rf .
    echo "${alert} Empty branch ${bldwht}$1${alert} created!"
}


function rt {
    app_name=$1
    rm -rI $app_name
    rapp $app_name
    cd $app_name
    rake features
}

function create_chef_cookbook {
    rake new_cookbook COOKBOOK=$1
}

function connect_to_sidney.spectro.jussieu.fr {
    ssh sid137@sidney.spectro.jussieu.fr \
    -L 3389:manip15g.spectro.jussieu.fr:3389 \
    -L 8333:manip15g.spectro.jussieu.fr:8333
}

# spp hostname user
# #to copy my ssh key to login to host as user
function copy_public_ssh_key_to_host {
    host=${1:=${VPS}}
    user=$2 
    : ${user:=root}
    ssh-copy-id -i ~/.ssh/id_rsa $user@$host
}


function sdb {
	filename=$1
	cut -f2 -d';'  $filename | tail -n+2  | sort -u 
}
function sbl {
	filename=$1
	cat $filename | tail -n+2 | sed -r 's/"//g' | sort -u
}	

function lowercase {
 cat $1 |sed 's/\(.*\)/\L\1/'
}

function initialize {
	rm .ssh/known_hosts
	server=${1:=${VPS}}
	role=$2
	: ${role:=rails}

    ssh-copy-id -i ~/.ssh/id_rsa root@$server
	ssh root@$1 "wget http://github.com/sid137/chef-repo/raw/master/install.sh -O install.sh && /bin/bash -x install.sh ${role}" 
}

#f#u#n#c#t#i#o#n #i#n#s#t#a#l#l#_#r#v#m #{
	#m#k#d#i#r #-#p #~#/#.#r#v#m#/#s#r#c#/
	#c#d #~#/#.#r#v#m#/#s#r#c 
	#r#m #-#r#f #.#/#r#v#m#/ 
	#g#i#t #c#l#o#n#e #-#-#d#e#p#t#h #1 #g#i#t#:#/#/#g#i#t#h#u#b#.#c#o#m#/#w#a#y#n#e#e#s#e#g#u#i#n#/#r#v#m#.#g#i#t 
	#c#d #r#v#m 
	#.#/#i#n#s#t#a#l#l
#}


src () {mv $1 $src}
base (){
  usage='Usage: base filename suffix'
  #removes extension of filename in $1
  #concatenantes $2 if provided
  if (( $# == 0 )) then;
    echo $usage
  else
    var=`echo $1 | sed "s/\([^.*]\)\.\(.*\)*$/\1/g"`
    echo ${var}${2}
  fi
}

vstat() {
    echo "GET /service/stationdetails/$1 HTTP/1.0\n\n" | nc www.velib.paris.fr 80 | tail -n7
}

vlist() {
echo -e "GET /service/carto HTTP/1.0\n\n" | nc www.velib.paris.fr 80
}

function trada:gwords {
    price=$1
    filename=${2:=website.tsv}
    blacklist=${3:=blacklist}
    cut -f1 $filename | tail -n+2 | awk '{print $0 ",'$price','$price'"}'
}


function color-list {
    # Text color variables
    txtund=$(tput sgr 0 1)          # Underline
    txtbld=$(tput bold)             # Bold
    bldred=${txtbld}$(tput setaf 1) #  red
    bldblu=${txtbld}$(tput setaf 4) #  blue
    bldwht=${txtbld}$(tput setaf 7) #  white
    txtrst=$(tput sgr0)             # Reset
    info=${bldwht}*${txtrst}        # Feedback
    pass=${bldblu}*${txtrst}
    warn=${bldred}!${txtrst}

    echo
    echo -e "$(tput bold) reg  bld  und   tput-command-colors$(tput sgr0)"

    for i in $(seq 1 7); do
    echo " $(tput setaf $i)Text$(tput sgr0) $(tput bold)$(tput setaf $i)Text$(tput sgr0) $(tput sgr 0 1)$(tput setaf $i)Text$(tput sgr0)  \$(tput setaf $i)"
    done

    echo ' Bold            $(tput bold)'
    echo ' Underline       $(tput sgr 0 1)'
    echo ' Reset           $(tput sgr0)'
}


function column-count {
# Usage: gawk $filename
#
# Returns the number of columns in a tab-delimited file $fileename
#
# Improvements: pass options to specify the delimiter character.  Currently only
# uses the tab delimiter

    gawk 'BEGIN {FS="\t"} ; END{print NF}'
}

function find_and_replace  {
# Usage: find_and_replace $target $replacement
#
# Recursively search the files in the child directories for the target string,
# and replace the target string in place with replacement
#
# Improvements:  Could pass options to ack to improve filetypes searched

    target=$1
    replacement=$2
    ack -l $target | xargs -n 1 sed -i "s/$target/$replacement/g"
}




## Heroku command shortcuts
# Taken from comments here:
# http://jqr.github.com/2010/08/27/easy-heroku-deploys-with-heroku-san.html
#
function staging() { heroku $@ --app $(basename `pwd`)-staging ;}
function production() { heroku $@ --app $(basename `pwd`)-production ;}
function demo() { heroku $@ --app $(basename `pwd`)-demo ;}
function development() { heroku $@ --app $(basename `pwd`)-development ;}
alias stage='staging'
alias dev='development'
alias prod='production'
