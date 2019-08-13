#!/bin/bash
mysql << EOFMYSQL
update mysql.user set authentication_string=password('oracle') where user='root';
flush privileges;
quit;
EOFMYSQL
systemctl start mysqld.service
systemctl status mysqld.service
mysql -u root -poracle << EOFMYSQL
set password = password('12345');
create database test;
show databases;
GRANT ALL ON *.* TO root@"%" identified by "123456";
quit;
EOFMYSQL
