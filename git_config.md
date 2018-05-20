# github配置以及git使用 #

> 前面两篇中有不少错误，现在进行一些更正。


## 配置github的过程： ##

1. 官网注册账号，验证邮箱
2. 本地配置ssh： ssh-keygen -t rsa -C "your_email@youremail.com"
 >
 > 注：后面的your_email@youremail.com改为你在github上注册的邮箱
 >
 >成功的话会在~/下生成.ssh文件夹，进去，打开id_rsa.pub，复制里面的key
 >
3. 回到github上，进入 Account Settings（账户配置），左边选择SSH Keys，Add SSH Key粘贴在你电脑上生成的key
4. 验证ssh是否配置好
 > ssh -T git@github.com
5. 写配置文件：
 >
 > git config --global user.name "your name"
 >
 > git config --global user.email "your_email@youremail.com"
 >


## 使用git的方式： ##

1. 添加文件：
>>            git add filename
>>            git commit -m "文件修改评注"
2. 删除文件：git rm filename
git commit -m ""
>
> 注：第一步是用git add把文件添加进去，实际上就是把文件修改添加到暂存区；
>
> 第二步是用git commit提交更改，实际上就是把暂存区的所有内容提交到当前分支。
>
3.修改文件和添加文件的操作相同



## GitHub的使用:  ##

### 方式一： ###
1. 在GitHub上创建一个初始化过的新远程库
2. git clone 把远程仓库下载到本地。克隆地址使用ssh地址（push的时候，可以不用输入密码）。
3. 在本地进行一些增删改动操作
4. git push origin master推送到Github上的远程库

### 方式二： ###
1. 在本地创建本地仓库，git init
2. 在github上新建一个新的远程库
3. 要关联一个github上的远程库，使用命令git remote add origin git@github:username/reponame.git；
4. 关联后，使用命令git push -u origin master第一次推送master分支的所有内容；
5. 此后，每次本地提交后，就可以使用命令git push origin master推送最新修改
