#!/bin/bash

function docker_connect {
  container=$1
  docker exec -it $container /bin/bash
}

alias dconn='docker_connect'
