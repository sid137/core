# Some crazy thing to make rpsec2 work 
# http://www.ruby-forum.com/topic/206187
export RUBYOPT=rubygems
export RSPEC=true

export RDOCOPT="-S -f html -T hanna"
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus


# Using Rsense code lookup for ruby
# http://github.com/m2ym/rsense/blob/master/doc/manual.txt
export RSENSE_HOME=~/core/ext/rsense

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt autocd autopushd  pushdignoredups
setopt rmstarsilent
unsetopt beep
setopt extended_glob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sid137/.zshrc'



autoload -Uz compinit
autoload zmv
compinit
#ZLS_COLORS=$LS_COLORS
# End of lines added by compinstalli
export TERM=xterm-color
PS1=$'%{\e[0;31m%}%{\e[0m%}%{\e[0m%}%{\e[1;34m%}:%{\e[0m%}%{\e[1;32m%}%~%{\e[0m%} $ '

# export EDITOR="emacs"
export BOOST_ROOT=/usr/local/boost
export VPS=173.203.101.247
export SAFE=~/core
export ATLAS=/usr/lib/atlas
export JAVA_HOME=/usr/lib/jvm/java-6-sun-1.6.0.16
export EC2_HOME=$HOME/.ec2/ec2-api-tools-1.2-9739
export PATH=$PATH:$EC2_HOME/bin:$SAFE/bin:/opt/eagle-5.6.0/bin/:$HOME/bin/avr
export MAKEFILES=~/Makefile
export DW=ami-3e836657
export src=~/src
export tools=~/src/tools
export data=~/projects/datasets
export ass=http://tools.assembla.com/svn/sid137	
export pass=${ass}/projects
export gomm='https://gomm.svn.sourceforge.net/svnroot/gomm/trunk'
export simpinst='https://simpinstall.svn.sourceforge.net/svnroot/simpinstall/trunk'
# Make EAGLE PCB not transparent with compiz
export XLIB_SKIP_ARGB_VISUALS=1
. ~/.ec2/.info
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
export PYTHONPATH=/home/sid137/.ipython:$DISLIN/python
# For AMD Stream
#export LD_LIBRARY_PATH=/usr/local/amdcal/lib64/:/usr/local/amdbrook/sdk/lib:$LD_LIBRARY_PATH

export PATH=~/matlab/bin:$PATH

# [end of auto-screen snippet]
#
[[ $EMACS = t ]] && unsetopt zle
export XILINX_USB_DEV=005:026
export LREPO=~/projects/templates/


if [[ -s /home/sid137/.rvm/scripts/rvm ]] ; then 
	source /home/sid137/.rvm/scripts/rvm ; 
fi


# Shortcut to initialize rails apps with templates
function rapp {
    appname=$1
    template=$2
    rails $appname -m http://github.com/sid137/rails-templates/raw/master/${template:-rails3}.rb 
}

# commit git repo and push to github
function gpm {
    message=$1
    git commit -a -m $message
    git push --all
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

function initialize {
	rm .ssh/known_hosts
	server=${1:=${VPS}}
	role=$2
	: ${role:=rails}

    ssh-copy-id -i ~/.ssh/id_rsa root@$server
	ssh root@$1 "wget http://github.com/sid137/chef-repo/raw/master/install.sh -O install.sh && /bin/bash -x install.sh ${role}" 
}

function install_rvm {
	mkdir -p ~/.rvm/src/
	cd ~/.rvm/src 
	rm -rf ./rvm/ 
	git clone --depth 1 git://github.com/wayneeseguin/rvm.git 
	cd rvm 
	./install
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

vstat() {
        echo "GET /service/stationdetails/$1 HTTP/1.0\n\n" | nc www.velib.paris.fr 80 | tail -n7
}

vlist() {
         echo -e "GET /service/carto HTTP/1.0\n\n" | nc www.velib.paris.fr 80
}

