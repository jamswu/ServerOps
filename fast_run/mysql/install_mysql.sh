#!/bin/bash
yum -y install http://dev.mysql.com/get/mysql57-community-release-el7-10.noarch.rpm  #安装 Yum Repository
yum -y remove mariadb-libs #为防止和mariadb出现冲突，卸载mariadb相关
yum -y install mysql-community-server #使用yum安装MySQL
systemctl start  mysqld.service
systemctl status mysqld.service
yum -y remove mysql57-community-release-el7-10.noarch #每次yum操作都会自动更新，需要把rpm卸载掉

grep "password" /var/log/mysqld.log
mysql -uroot -p     # 回车后会提示输入密码上面显示的密码
# 设置数据库密码(需手动执行)
# mysql> 
# set global validate_password_policy=0;
# set global validate_password_length=1;
# ALTER USER 'root'@'localhost' IDENTIFIED BY '数据库密码';
# grant all on *.* to root@'%' identified by '数据库密码';