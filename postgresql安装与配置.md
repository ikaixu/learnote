# Postgresql9.5安装配置指南
1. 安装配置环境
    > 服务端(server)：
    >> hostos---centos8
    > hostip---192.168.1.189
    > hostuser---kai(非root用户，可以使用sudo)
    >
    > 客户端(client)：
    >> hostos---archlinux
    >> hostip---192.168.1.67
    >> hostuser---kai(非root用户，可以使用sudo)

2. 服务端安装与简单配置（本地运行）
    2.1 安装
    > // 下载源码（南大开源镜像）
    > `wget https://mirrors.nju.edu.cn/postgresql/source/v9.5.25/postgresql-9.5.25.tar.gz`
    > // 解压  
    > `tar -xf postgresql-9.5.25.tar.gz`
    > // 编译与安装
    > `cd postgresql-9.5.25` 
    > `mkdir build`
    > `cd build`
    > `./configure`
    > `make && sudo make install`
    > // 添加管理员用户（linux用户，默认为postgres）
    > `sudo adduser postgres`

    2.2 启动服务器
    > // 创建数据目录
    > `sudo mkdir /usr/local/pgsql/data`
    > // 更改数据目录权限
    > `sudo chown postgres /usr/local/pgsql/data`
    > // 切换至管理员用户
    > `su - postgres`
    > // 初始化存储区域
    > `/usr/local/pgsql/bin/initdb -D /usr/local/pgsql/data`
    > // 启动服务器
    > `/usr/local/pgsql/bin/postgres -D /usr/local/pgsql/data >logfile 2>&1 &`
    > // 连接postgres用户(postgres数据库)
    > `/usr/local/pgsql/bin/psql`
    > // 创建test用户
    > `CREATE USER test  ENCRYPTED PASSWORD 'password' LOGIN;`
    > // 创建名称为test的数据库
    > `CREATE DATABASE test OWNER test;`
    > // 退出数据库
    > `\q`

    2.3 关闭服务器
    > <code>kill -INT &#96;head -1 /usr/local/pgsql/data/postmaster.pid&#96;</code>
    > // 退出管理员用户
    > `exit`

3. 服务器文件配置（在初始化的数据库集中修改配置文件）
    > // 修改postgres.conf文件
    > `vim /ur/local/pgsql/data/postgres.conf`
    > ....
    >> `listen_addresses=‘0.0.0.0’`
    >> `port=5432`
    > 
    > ....
    >
    > // 修改pg_hba.conf 
    > `vim /usr/local/pgsql/data/pg_hba.conf`
    > ...
    >> `host all all 192.168.1.0/24 md5`
    >
    > ...
    >

5. 开启服务器端端口
    > // 查看已经开放的端口
    > `sudo firewall-cmd --list-ports`
    > // 开放默认端口5432
    > `sudo firewall-cmd --zone=public --add-port=5432/tcp --permanent`
    > // 重启防火墙
    > ` sudo systemctl reload firewalld`


4. 客户端配置
    > //安装客户端软件，这里使用官方客户端
    > `sudo pacman -S postgresql`
    > //远程连接服务器
    > `psql -h192.168.1.189 -p5432 -Utest -dtest`