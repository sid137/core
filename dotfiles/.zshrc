. ~/.zaliases
unsetopt auto_name_dirs
[ -f ~/billfloat/.billfloat ] && . ~/billfloat/.billfloat
[ -f ~/.billfloat_functions ] && . ~/.billfloat_functions
## Some crazy thing to make rpsec2 work 
## http://www.ruby-forum.com/topic/206187
export SECRETS=$HOME/secrets
export OMP_NUM_THREADS=4
export RUBYOPT=rubygems
export RUBYLIB=~/lib
export RSPEC=true

export RDOCOPT="-S -f html"
export TRACKING=~/tracking

# Deactivate for now..  install_ scripts screw up homebrew...  THANKS
# HOMEBREW!!!!!!11!!
#export PATH=$HOME/core/installers:$PATH

export PATH=$HOME/core/bin:$PATH
export PATH=$HOME/tracking/go/bin:$PATH
export PATH=$HOME/local/node/bin:$PATH
export PATH=$HOME/local/mongo/bin:$PATH
export PATH=$HOME/local/couchdb/bin:$PATH
export PATH=$HOME/local/redis/bin:$PATH
export PATH=$HOME/local/erlang/bin:$PATH
export PATH=$HOME/local/imagemagick/bin:$PATH
export PATH=$HOME/local/firefox:$PATH
export PATH=$HOME/local/vim/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH 
export PATH=$PATH:/usr/local/mysql/bin
# export PATH=$PATH:./bin:${PATH//:\\.\\/bin:} 
export PATH=$PATH:/usr/local/sbin 
export PATH=/usr/local/bin:$PATH

export DEV_ENV=vagrant

# Amazon IAM Toolkit
export AWS_IAM_HOME=$HOME/local/IAMCli-1.2.0
export PATH=$PATH:$AWS_IAM_HOME/bin

export EDITOR="vim"
export MAKEFILES=~/Makefile
# Lines configured by zsh-newuser-install
export HISTFILE=~/.histfile
export HISTSIZE=1000000
export SAVEHIST=1000000
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
[ -f ~/secrets/secret_credentials ] && . ~/secrets/secret_credentials
autoload -Uz compinit
autoload zmv
compinit


#ZLS_COLORS=$LS_COLORS
# End of lines added by compinstalli
. ~/core/git-prompt/git-prompt.sh
export TERM=xterm-color

#Prompt Color Table Z shell
fg_black=$'\e[0;30m'
fg_red=$'\e[0;31m'
fg_green=$'\e[0;32m'
fg_brown=$'\e[0;33m'
fg_blue=$'\e[0;34m'
fg_purple=$'\e[0;35m'
fg_cyan=$'\e[0;36m'
fg_lgray=$'\e[0;37m'
fg_dgray=$'\e[1;30m'
fg_lred=$'\e[1;31m'
fg_lgreen=$'\e[1;32m'
fg_yellow=$'\e[1;33m'
fg_lblue=$'\e[1;34m'
fg_pink=$'\e[1;35m'
fg_lcyan=$'\e[1;36m'
fg_white=$'\e[1;37m'
#Text Background Colors
bg_red=$'\e[0;41m'
bg_green=$'\e[0;42m'
bg_brown=$'\e[0;43m'
bg_blue=$'\e[0;44m'
bg_purple=$'\e[0;45m'
bg_cyan=$'\e[0;46m'
bg_gray=$'\e[0;47m'
#Attributes
at_normal=$'\e[0m'
at_bold=$'\e[1m'
at_italics=$'\e[3m'
at_underl=$'\e[4m'
at_blink=$'\e[5m'
at_outline=$'\e[6m'
at_reverse=$'\e[7m'
at_nondisp=$'\e[8m'
at_strike=$'\e[9m'
at_boldoff=$'\e[22m'
at_italicsoff=$'\e[23m'
at_underloff=$'\e[24m'
at_blinkoff=$'\e[25m'
at_reverseoff=$'\e[27m'
at_strikeoff=$'\e[29m'

PS1=$'$(prompt_git_info)%{$terminfo[bold]$fg[blue]%}:%{\e[0m%}%{$terminfo[bold]$fg[green]%}%~%{\e[0m%} $ '
if [ -n "$SSH_TTY" ]; then
  ip_address=`echo $SSH_CONNECTION | cut -f3 -d' '` 
  PS1=$'${fg_red}%M${at_normal}${fg_cyan}/$ip_address${at_normal}$(prompt_git_info)%{$terminfo[bold]$fg[blue]%}:%{\e[0m%}%{$terminfo[bold]$fg[green]%}%~%{\e[0m%} $ '
fi


# This is probably important.. i need to figure out what to do here
#export JAVA_HOME=/usr/lib/jvm/java-6-sun-1.6.0.16
#export JAVA_HOME=/usr/lib/jvm/java-6-openjdk

#export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib:$HOME/local/imagemagick/lib:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/usr/local/hdf5-1.6/lib:$LD_LIBRARY_PATH
#export DYLD_LIBRARY_PATH=$HOME/local/imagemagick/lib:$DYLD_LIBRARY_PATH


export FOG_RC=~/secret-credentials/.fog


##//cappuccino path
#export CAPP_BUILD='/tmp/capp'
#export BOOST_ROOT=/usr/local/boost
export SAFE=~/core


export vpswordpress=108.166.124.128

# Text color variables
export txtund=$(tput sgr 0 1)     # Underline
export txtbld=$(tput bold)        # Bold
export txtred=$(tput setaf 1)     # Red
export txtgrn=$(tput setaf 2)     # Green
export txtylw=$(tput setaf 3)     # Yellow
export txtblu=$(tput setaf 4)     # Blue
export txtpur=$(tput setaf 5)     # Purple
export txtcyn=$(tput setaf 6)     # Cyan
export txtwht=$(tput setaf 7)     # White
export txtrst=$(tput sgr0)        # Text reset
export txtund=$(tput sgr 0 1)           # Underline
export txtbld=$(tput bold)              # Bold
export bldred=${txtbld}$(tput setaf 1)  #  red
export bldblu=${txtbld}$(tput setaf 4)  #  blue
export bldwht=${txtbld}$(tput setaf 7)  #  white
export bldgrn=${txtbld}${txtgrn}
export alert=${bldgrn}
export txtrst=$(tput sgr0)              # Reset
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
    rails new $appname --skip-gemfile -JTm https://github.com/sid137/rails-templates/raw/master/${template:-rails31}.rb 
}
function rapp-test {
    appname=$1
    template=$2
    rails new $appname --skip-gemfile -JTm ~/tracking/rails-templates/${template:-rails31}.rb 
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

function clone_core {
  git clone 
}

function greenfield {
	host=${1:=${VPS}}
	user=${2:=sid137}
  ssh-copy-id -i ~/.ssh/id_rsa $user@$host
  scp ~/.ssh/vps-github $user@$host:~/.ssh/
  scp ~/.ssh/vps-github.pub $user@$host:~/.ssh

  # Create a ssh/config file so we can connect to git
  # http://stackoverflow.com/a/1655389/262972
IFS='\n' read -r -d '' ssh_config << 'EOF'
Host github.com
    IdentityFile ~/.ssh/vps-github
    User git
EOF

# another syntax http://serverfault.com/a/249095
ssh $user@$host << EOS
  echo '"$ssh_config"' >> ~/.ssh/config
  git clone -b minimal git@github.com:sid137/core.git
  ./core/symlink.sh
  chsh -s `which zsh` $user
EOS
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


function reverse_tunnel {
    ssh -R $port:localhost:22
}


kapow(){
 touch ~/.pow/$1/tmp/restart.txt;
 if [ $? -eq 0 ]; then; echo "pow: restarting $1" ; fi
}
# compctl -W ~/.pow -/ kapow
