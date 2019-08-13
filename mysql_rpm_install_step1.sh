#!/bin/bash
#更新mysql
#rpm -Uvh *.rpm --force --nodeps
rpm -ivh *.rpm --force --nodeps
iptables -L
iptables -F
iptables -L
systemctl start mysqld.service
systemctl status mysqld.service
#強制修改密碼root密碼為oracle
systemctl stop mysqld.service
systemctl status mysqld.service
killall mysqld
mysqld -u root --skip-grant-tables &


