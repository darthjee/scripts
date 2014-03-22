#!/bin/bash

is_root() {
  if [[ $EUID == '0' ]]; then
    return 0
  else
    return 1
  fi
}

has_prog() {
  return $(which $1 > /dev/null)
}

install_pkgs() {
  PKGS="vim screen libmysqld-dev libmysqlclient-dev mysql-client mysql-server php5-cgi apache2"
  PKGS="$PKGS postgresql-server-dev-9.1 postgresql-9.1 curl cups swat abiword imagemagick"
  PKGS="$PKGS openvpn git meld"
  apt-get install $PKGS
}

install_rvm() {
  source /usr/local/rvm/scripts/rvm
  if ! $(has_prog rvm); then
    \curl -sSL https://get.rvm.io | bash -s stable --ruby
    source /usr/local/rvm/scripts/rvm

    echo "source /usr/local/rvm/scripts/rvm" >> /etc/profile
    echo no rvm
  fi
  RUBIES="1.9.3-p392 2.0.0-p247 2.0.0-p353"
  
  for RUBY in $RUBIES; do
    rvm install $RUBY
  done
}

install_postgres() {
  FILE="/etc/postgresql/9.1/main/pg_hba.conf"

  if ! (grep "postgres\\s\\+md5" $FILE > /dev/null); then
    apt-get install postgresql-server-dev-9.1
    EXPRESSION="s/\(local\\s\\+all\\s\\+postgres\\s\\+\)\(peer\|md5\)/\\1trust/g"
    sed -e $EXPRESSION -i $FILE
    /etc/init.d/postgresql restart
    echo "ALTER USER postgres WITH PASSWORD 'postgres'" | psql --user postgres
    EXPRESSION="s/\(local\\s\\+all\\s\\+postgres\\s\\+\)trust/\\1md5/g"
    sed -e $EXPRESSION -i $FILE
    /etc/init.d/postgresql restart
  fi
}

install_heroku(){
  wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
}

STEPS="pkgs rvm postgres heroku"

if $(is_root); then
  if [ $1 ]; then
    while [ $1 ]; do
      if [ $1 == "all" ]; then
        $0 $STEPS
      else
        install_$1
      fi

      shift 1
    done
  else
    $0 all
  fi
else
  sudo $0 $*
fi
