#!/bin/bash
if [[ $1 = '-h' || $1 = '--help' ]]; then
  printf "
  \n--------------------------------------------------------------------------\n
  Usage: bash pyenv.sh without an arguments
  This is script for install pyenv and virtualenv in Linux OS. It has been
  tested on CentOS 7, CentOS 8, Fedora 31, Debian 10.2, Ubuntu 18.04,
  Ubuntu 19.10, Arch Linux and Alpine Linux v3.11
  \n--------------------------------------------------------------------------\n"
  exit
fi
clear
# Function to install pyenv
function pyenvinstall {
  if [ -d ~/.pyenv ]; then
    printf "\nPyenv is already installed\n"
  else
    printf '\nStart install pyenv\n'
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
    source ~/.bashrc
    printf '\nPyenv has been successfully installed\n'
  fi
}
# Function to install virtualenv
function virteinstal {
  if [ -d ~/.pyenv/plugins/pyenv-virtualenv ]; then
    printf "\nVirtualenv is already installed\n"
  else
    printf '\nStart install virtualenv\n'
    git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
    source ~/.bashrc
    printf "\nVirtualenv has been successfully installed\n"
  fi
}
# Check our OS family
if [ -f /etc/os-release ]; then
  . /etc/os-release
    OS=$NAME
    echo -n "Is you OS:" $OS " (Y/N)? "
    while read -r -n 1 -s answer; do
       if [[ $answer = [YyNn] ]]; then
          if [[ $answer = [Yy] ]]; then
            break
          elif [[ $answer = [Nn] ]]; then
            printf "\nAlarm\n"
            exit
          fi
       fi
    done
    if [[ ${OS} = 'Fedora' || ${OS} = 'CentOS Linux' ]]; then
      # Install reqired packages
      if [[ ${OS} = 'CentOS Linux' ]]; then
        pm='yum'
      elif [[ ${OS} = 'Fedora' ]]; then
        pm='dnf'
      fi
        printf "\nBefore you start, please, run this commands in another terminal:
      \n------------------------------------------------------------------------
      \nsudo "$pm" update
      \nsudo "$pm" install gcc zlib-devel bzip2 bzip2-devel readline-devel \
sqlite sqlite-devel openssl-devel tk-devel libffi-devel git
      \n---------------------------------------------------------------------\n"
      read -n 1 -s -r -p "Press any key to continue"

      # Install pyenv
      pyenvinstall

      # Install virtualenv
      virteinstal

    elif [[ ${OS} = 'Ubuntu' || ${OS} = 'Debian GNU/Linux' || ${OS} = 'Linux Mint' ]]; then
      # Install reqired packages
      printf "\nBefore you start, please, run this commands in another terminal:
      \n------------------------------------------------------------------------
      \nsudo apt-get update
      \nsudo apt-get install --no-install-recommends make build-essential \
libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev \
wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
libffi-dev liblzma-dev git
      \n----------------------------------------------------------------------\n"
      read -n 1 -s -r -p "Press any key to continue"

      # Install pyenv
      pyenvinstall

      # Install virtualenv
      virteinstal

   elif [[ ${OS} = 'Arch Linux' ]]; then
     # Install reqired packages
     printf "\nBefore you start, please, run this commands in another terminal:
     \n------------------------------------------------------------------------
     \nsudo pacman -Syu
     \nsudo pacman -S base-devel openssl zlib git
     \n----------------------------------------------------------------------\n"
     read -n 1 -s -r -p "Press any key to continue"

     # Install pyenv
     pyenvinstall

     # Install virtualenv
     virteinstal

   elif [[ ${OS} = 'Alpine Linux' ]]; then
     # Install reqired packages
     printf "\nBefore you start, please, run this commands in another terminal:
     \n------------------------------------------------------------------------
     \n run as root
     \napk update && apk upgrade
     \napk add --no-cache git bash build-base libffi-dev openssl-dev \
bzip2-dev zlib-dev readline-dev sqlite-dev
     \n----------------------------------------------------------------------\n"
     read -n 1 -s -r -p "Press any key to continue"

     # Install pyenv
     pyenvinstall

     # Install virtualenv
     virteinstal
   fi
fi
printf '\nAfter install please enter next command: "source ~/.bashrc"\n'
