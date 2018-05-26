autoload -Uz compinit
autoload zmv
compinit

. ~/.zaliases
. ~/.aws_functions
. ~/.ivizone/ivizone.sh
. ~/.local/lib/aws/bin/aws_zsh_completer.sh
. ~/core/git-prompt/git-prompt.sh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
[ -f $SECRETS/secret_credentials ] && . $SECRETS/secret_credentials

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm




unsetopt auto_name_dirs
unsetopt nomatch
## Some crazy thing to make rpsec2 work 
## http://www.ruby-forum.com/topic/206187
export DYLD_FALLBACK_LIBRARY_PATH=/Applications/Postgres.app/Contents/Versions/latest/lib:$DYLD_LIBRARY_PATH

export SECRETS=$HOME/secrets
export OMP_NUM_THREADS=4
export RUBYOPT=rubygems
export RSPEC=true

export RDOCOPT="-S -f html"
export TRACKING=~/tracking
export rvmsudo_secure_path=1

export PATH=/usr/local/bin:$PATH
export PATH="./bin:$PATH"
export PGHOST=localhost 
export PGUSER=postgres
export AWS_CREDENTIAL_FILE=$AWS_AUTO_SCALING_HOME/credential-file-path.template
export EC2_REGION=eu-west-1
export AWS_AUTO_SCALING_URL=https://autoscaling.eu-west-1.amazonaws.com  
export PGDATA="/Users/sid137/Library/Application Support/Postgres/var-9.4"
export PYTHONDONTWRITEBYTECODE=1


export PATH=$HOME/aws/ebs/eb/macosx/python2.7:$PATH 
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:/usr/local/sbin 
export PATH=/usr/local/bin:$PATH
# export PATH=/Users/sid137/.local/lib/aws/bin:$PATH
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

export EDITOR="vim"
export MAKEFILES=~/Makefile
export SPRING_LOG=/tmp/spring.log
# Lines configured by zsh-newuser-install
export HISTFILE=~/.histfile
export HISTSIZE=1000000
export SAVEHIST=1000000

setopt APPEND_HISTORY # Don't erase history
setopt EXTENDED_HISTORY # Add additional data to history like timestamp
setopt INC_APPEND_HISTORY # Add immediately
setopt HIST_FIND_NO_DUPS # Don't show duplicates in search
setopt HIST_IGNORE_SPACE # Don't preserve spaces. You may want to turn it off
setopt NO_HIST_BEEP # Don't beep
setopt SHARE_HISTORY # Share history between session/terminals
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



# Cucumber-chef crap
export ORGNAME=sid137
# export AWS_ACCESS_KEY_ID=$AMAZON_ACCESS_KEY_ID
# export AWS_ACCESS_KEY=$AMAZON_ACCESS_KEY_ID
# export AWS_SECRET_ACCESS_KEY=$AMAZON_SECRET_ACCESS_KEY
# export AWS_SECRET_KEY=$AMAZON_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION=eu-west-1

#ZLS_COLORS=$LS_COLORS
# End of lines added by compinstalli
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
export JAVA_HOME=$(/usr/libexec/java_home)

#export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib:$HOME/local/imagemagick/lib:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/usr/local/hdf5-1.6/lib:$LD_LIBRARY_PATH
#export DYLD_LIBRARY_PATH=$HOME/local/imagemagick/lib:$DYLD_LIBRARY_PATH

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

function prok {
  server=$1
  port=${2:-9999}
  echo $server
  echo $port
  ssh $server -D $port
}


# spp hostname user
# #to copy my ssh key to login to host as user
function copy_public_ssh_key_to_host {
    host=${1:=${VPS}}
    user=$2 
    : ${user:=root}
    ssh-copy-id -i ~/.ssh/id_rsa $user@$host
}

function lowercase {
 cat $1 |sed 's/\(.*\)/\L\1/'
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

function reverse_tunnel {
    ssh -R $port:localhost:22
}


eval "$(direnv hook zsh)"


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

function postgres_password {
  username=$1
  password=$2
  echo "md5`echo -n "$password$username" | md5`"
}

# eval $(docker-machine env default)
# Python's virtualenvwrapper-RELATED
# export WORKON_HOME=$HOME/.virtualenvs
# source /Users/sid137/.local/lib/aws/bin/virtualenvwrapper.sh
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


export AWS_PROFILE=ivizone_production

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
