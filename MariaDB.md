# 安装与基本使用 #
1. 安装
> archlinux下,安装`mariadb`、`libmariadbclient` 和 `mariadb-clients` 软件包  
> 安装Mariadb软件包之后，你必须运行下面这条命令：  
> `# mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql` //设置参数  
> `# systemctl start mariadb` //启动进程  
> `# mysql_secure_installation` //运行自带安装脚本(设置root账号的密码)  
> `# systemctl restart mariadb` //重新启动进程

2. 配置管理
> 用MySQL的命令行工具，以root账号登录你的MySQL服务器:  
> `$ mysql -p -u root`  
> __root密码管理(方法一)__
> 修改root账号的密码(修改的仅仅是root@localhost的密码(包括了'root'@'127.0.0.1'))  
> `mysqladmin -u root -p flush-privileges password`  
> 刷新,让密码生效  
> `mysqladmin -u root -p flush-privileges`  
> __密码管理(方法二)__
> 查看所有root与主机名称的组合  
> `$ mysql -u root -p -e "SELECT User,Host FROM mysql.user;"`  
> 其他方法修改root账号密码  
> `$ mysql -u root -p -e "SET PASSWORD FOR 'root'@'localhost' PASSWORD('new_pwd');"`  
> `$ mysql -u root -p -e "SET PASSWORD FOR 'root'@'127.0.0.1' PASSWORD('new_pwd');"`  
> _注意:_localhost和127.0.0.1是相同的主机,但这种方法仍要分两次来改密码  
> 删除匿名用户和不想要的用户  
> `$ mysql -u root -p -e "DROP USER 'root'@'::1';"`(不想要的用户)  
> `$ mysql -u root -p -e "DROP USER ''@'localhost';"`(匿名用户)  

3. 创建用户
> 方法一,登录root用户后创建  
> `$ mysql -u root -p`  
> MariaDB> CREATE USER 'monty'@'localhost' IDENTIFIED BY 'some_pass';  
> MariaDB> GRANT ALL PRIVILEGES ON mydb.* TO 'monty'@'localhost'  
> MariaDB> FLUSH PRIVILEGES;  
> MariaDB> quit  
> 创建一个密码为'some_pass'的'monty'用户的示例,并赋予它在 mydb 完全操作权限  
>   
> 方法二,命令行模式  
> $ mysql -u root -p -e "GRANT ALL ON *.* TO 'russell'@'localhost' IDENTIFIED BY 'some_pass';"  
> 创建一个ressell的用户,并且赋予它所有(ALL)的权限.  
> *.*表示所有的表和数据库
> 密码为'some_pass'

4. 配置文件
> 依次读取  
> `/etc/my.cnf` `/etc/mysql/my.cnf` `~/.my.cnf`  
> 要拒绝远程连接，取消注释 `/etc/mysql/my.cnf` 中以下这行：  
> `skip-networking`  
> MySQL 默认禁用客户端自动补全功能。要在整个系统中启用它，编辑 /etc/mysql/my.cnf，将 `no-auto-rehash` 替换为 `auto-rehash`。  

用到再补全

# 1简单上手使用案例 #
## 上手 ##
1. 创建mckk用户，赋予所有的数据库和表完全的权限  
2. 连接到服务器:`mysql -u mckk -p`  
3. 查看服务器上已经存在的数据库:`show databases;`  
4. 建一个数据库:`create database test;`  
5. 在该数据库下建一个表:`create table test.books(book_id int, title text, status int);`  
6. 列出数据库test中所有表:`show tables from test;`  
7. 切换到数据库`use test;`  
8. tips:上面建完数据库后，就可以切换到数据库，然后在数据库里`create table`  
9. 展示test中所有表`show tables;`  
10. 展示表的结构`describe books;`  

## 插入和操作数据 ##

## 连接表格做分析 ##

