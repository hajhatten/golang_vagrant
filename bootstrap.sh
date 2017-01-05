#!/bin/bash

# install git
sudo apt-get install -y git

# golang installation variables
VERSION='1.7.4'
OS='linux'
ARCH='amd64'

# install golang
wget https://storage.googleapis.com/golang/go$VERSION.$OS-$ARCH.tar.gz
sudo tar -C /usr/local -xzf ./go$VERSION.$OS-$ARCH.tar.gz
rm -rf ./go$VERSION.$OS-$ARCH.tar.gz

mkdir -p /home/vagrant/go/bin
mkdir -p /home/vagrant/go/pkg
mkdir -p /home/vagrant/go/src

# set environment variables
export PATH=$PATH:/usr/local/go/bin:/home/vagrant/go/bin
export GOPATH=/home/vagrant/go
echo "export GOPATH=/home/vagrant/go" >> /home/vagrant/.bashrc
echo "PATH=\$PATH:/usr/local/go/bin:/home/vagrant/go/bin" >> /home/vagrant/.bashrc

# print the go enviroment variables
go env

# go get tools
go get -u -v github.com/nsf/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v github.com/zmb3/gogetdoc
go get -u -v github.com/golang/lint/golint
go get -u -v github.com/lukehoban/go-outline
go get -u -v sourcegraph.com/sqs/goreturns
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v github.com/tpng/gopkgs
go get -u -v github.com/newhook/go-symbols
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v github.com/cweill/gotests/...
go get -u -v github.com/derekparker/delve/cmd/dlv
go get -u -v github.com/codegangsta/gin

# install vim-plug and vim-go
curl -fLo /home/vagrant/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/fatih/vim-go.git /home/vagrant/.vim/plugged/vim-go

cat <<EOT >> /home/vagrant/.vimrc
call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()
EOT

sudo chown -R vagrant:vagrant /home/vagrant/.vim
sudo chown -R vagrant:vagrant /home/vagrant/.vimrc
sudo chown -R vagrant:vagrant /home/vagrant/go

sudo chmod -R 0770 /home/vagrant/.vim
sudo chmod -R 0770 /home/vagrant/.vimrc
sudo chmod -R 0770 /home/vagrant/go

