# INSTALL PYENV AND VIRTUALENV ON LINUX
## This is bash script to install pyenv and virtualenv on various Linux systems
### Before install
Before install pyenv you have to install next packages (related of your OS):
- For CentOS 7 and Fedora 21 and below:
```bash
sudo yum update && yum install gcc zlib-devel bzip2 bzip2-devel readline-devel \
sqlite sqlite-devel openssl-devel tk-devel libffi-devel
```
- For CentOS 8 and Fedora:
```bash
sudo dnf update && dnf install make gcc zlib-devel bzip2 bzip2-devel \
readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel
```
- For Ubuntu/Debian/Mint:
```bash
sudo apt-get update && apt-get install --no-install-recommends make \
build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev \
libxmlsec1-dev libffi-dev liblzma-dev
```
- For Arch Linux:
```bash
sudo pacman -Syu && pacman -S base-devel openssl zlib git
```
- For Alpine Linux (run as root):
```bash
apk update && apk upgrade && apk add --no-cache git bash build-base libffi-dev \
openssl-dev bzip2-dev zlib-dev readline-dev sqlite-dev
```
### Installation
Just download this script and run it on your system
```bash
./pyenvinstall.sh
```
### Testing
This script has been tested on next OS: CentOS 7, CentOS 8, Fedora 31, Debian 10.2,
Ubuntu 18.04, Ubuntu 19.10, Arch Linux and Alpine Linux v3.11
### Contributing
Thanks [Pyenv](https://github.com/pyenv/pyenv) for this beautiful tool
### Authors of installation script
- Khramtsov Valentin
