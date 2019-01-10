#!/bin/bash
# SilverStripe Quick Installer

# Get directory name and SilverStripe version for install

directory=$1
version=$2
dbname=$3
mysqluser=$4
mysqlpwd=$5
hostname=$6

echo "-------------------------"
echo " composer install begins "
echo "-------------------------"

composer create-project silverstripe/installer $directory $version

/applications/MAMP/library/bin/mysql -u $mysqluser -p$mysqlpwd -e "create database if not exists $dbname;"

touch $directory/.env

line1="SS_BASE_URL=\"http://$hostname:8888/\""
line2=SS_DATABASE_CLASS="\"MySQLPDODatabase\""
line3=SS_DATABASE_NAME="\"$dbname\""
line4=SS_DATABASE_PASSWORD="\"$mysqluser\""
line5=SS_DATABASE_SERVER="\"localhost\""
line6=SS_DATABASE_USERNAME="\"$mysqlpwd\""
line7=SS_ERROR_LOG="\"error.log\""

echo "$line1" >>$directory/.env
echo "$line2" >>$directory/.env
echo "$line3" >>$directory/.env
echo "$line4" >>$directory/.env
echo "$line5" >>$directory/.env
echo "$line6" >>$directory/.env
echo "$line7" >>$directory/.env

echo "------------------------------------------"
echo " You will be asked for your sudo password "
echo "------------------------------------------"

sudo sh -c "echo \"127.0.0.1       $hostname\" >> /etc/hosts"

line11="<VirtualHost *>"
line12="    DocumentRoot \"/Applications/MAMP/htdocs/$directory/\""
line13="    ServerName $hostname"
line14="    ServerAlias $hostname"
line15="</VirtualHost>"

echo "$line11" >> /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf
echo "$line12" >> /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf
echo "$line13" >> /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf
echo "$line14" >> /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf
echo "$line15" >> /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf

php $directory/vendor/silverstripe/framework/cli-script.php dev/build "flush=1"

echo "-------------------------------"
echo " SilverStripe Build Successful "
echo "-------------------------------"

sudo /Applications/MAMP/Library/bin/apachectl stop 2> /dev/null 
sudo /Applications/MAMP/Library/bin/apachectl start 2> /dev/null &&
open http://$hostname:8888/

echo "------------------------------------------------"
echo " Thanks for using SilverStripe Quick Installer! "
echo "------------------------------------------------"


