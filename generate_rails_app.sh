#!/bin/bash
set -e
set -u
set -o pipefail

help() {
  echo -e "\n what require for this app"
}

db_environment=''

while getopts 'n:d:v:' OPTION; do
  case "$OPTION" in
    n)
      app_name="$OPTARG"
      echo "App name: $OPTARG"
      ;;
    d)
      db_name="$OPTARG"
      echo "databse: $db_name"
      ;;
    v)
      version="$OPTARG"
      echo "rails version: $version"
      ;;
    ?)
      help
      exit 1
      ;;
  esac
done
d=
case "$db_name" in
  "mysql")
    db="mysql"
    echo -n "database is: $db \n"
    ;;
  "postgresql")
    db="postgresql"
    echo -n "database is:  $db \n"
    ;;
  *)
    echo -n "Enter correct database name."
    exit 0
    ;;
esac


echo -e "\n > Rails app creating."
rails $version new $app_name -d=$db
