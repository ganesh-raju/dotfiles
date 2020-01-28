#!/bin/bash

# ref url https://askubuntu.com/questions/519/how-do-i-write-an-application-install-shell-script

PACKAGES='curl silversearcher-ag git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn mysql-server mysql-client libmysqlclient-dev postgresql-11 libpq-dev'

sudo apt-get update
sudo apt-get install -y $PACKAGES

#node related
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

#install ruby

cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.6.3
rbenv global 2.6.3
ruby -v

gem install bundler
rbenv rehash

#git setup

git config --global user.name "Name"
git config --global user.email "Email"

#install rails

gem install rails -v 5.1.7
rbenv rehash
