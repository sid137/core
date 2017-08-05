export IVIZONE_HOME=~/ivizone
export IVIZONE_CONFIG_HOME=~/.ivizone
export IVIZONE_CONFIG=$IVIZONE_CONFIG_HOME/ivizone.sh
export IVIZONE_DATA_DIRECTORY=$IVIZONE_HOME/data
export IVIZONE_PATH=$IVIZONE_HOME/ivizone-tools
export IVIZONE_ENV=development
export PATH=$PATH:$IVIZONE_PATH


# export SPARK_HOME="/usr/local/Cellar/apache-spark/1.6.0"
# export PYTHONPATH=$SPARK_HOME/libexec/python:$SPARK_HOME/libexec/python/build:$PYTHONPATH
# export PYTHONPATH=$SPARK_HOME/python/lib/py4j-0.8.2.1-src.zip:$PYTHONPATH

alias vivi='vim $IVIZONE_CONFIG; . $IVIZONE_CONFIG'
alias ss='spark-submit'

alias activate="source env/bin/activate"
alias venv='virtualenv env; source env/bin/activate'
alias spy='python setup.py'

export HADOOP_HOME=/usr/local/Cellar/hadoop/2.7.2/libexec
alias hstart='start-dfs.sh; start-yarn.sh'
alias hstop='stop-yarn.sh;stop-dfs.sh'
. $IVIZONE_CONFIG_HOME/docker_functions.sh


function alessh {
  ale_server=$1
  ssh aruba@$ale_server -i ~/aruba.pem
}

ecs () {
  ssh -i ~/.ssh/ivizone-shared.pem ubuntu@$1
}
