# github配置以及git使用 #

> 前面两篇中有不少错误，现在进行一些更正。


## 配置github的过程： ##

1. 官网注册账号，验证邮箱
2. 本地配置`ssh`： `ssh-keygen -t rsa -C "your_email@youremail.com"`
 >
 > 注：后面的`your_email@youremail.com`改为你在github上注册的邮箱
 >
 >成功的话会在`~/`下生成`.ssh`文件夹，进去，打开`id_rsa.pub`，复制里面的key
 >
3. 回到`github`上，进入 `Account Settings`（账户配置），左边选择`SSH Keys`，`Add SSH Key`粘贴在你电脑上生成的key
4. 验证`ssh`是否配置好:`ssh -T git@github.com`
5. 写配置文件:  
&emsp;&emsp;&emsp;&ensp;`git config --global user.name "your name"`  
&emsp;&emsp;&emsp;&ensp;`git config --global user.email "your_email@youremail.com"`


## 使用git的方式： ##

1. 添加文件：  
&emsp;&emsp;&emsp;&ensp;`git add filename`             
&emsp;&emsp;&emsp;&ensp;`git commit -m "文件修改评注"`
2. 删除文件:  
&emsp;&emsp;&emsp;&ensp;`git rm filename`  
&emsp;&emsp;&emsp;&ensp;`git commit -m ""`
> 注：第一步是用 `git add` 把文件添加进去，实际上就是把文件修改添加到暂存区；  
> 第二步是用 `git commit` 提交更改，实际上就是把暂存区的所有内容提交到当前分支。  
3. 修改文件和添加文件的操作相同



## GitHub的使用:  ##

### 方式一： ###
1. 在`GitHub`上创建一个初始化过的新远程库
2. `git clone` 把远程仓库下载到本地。克隆地址使用`ssh`地址（`push`的时候，可以不用输入密码）。
3. 在本地进行一些增删改动操作
4. `git push origin master`推送到`Github`上的远程库

### 方式二： ###
1. 在本地创建本地仓库，`git init`
2. 在`github`上新建一个新的远程库
3. 要关联一个`github`上的远程库，使用命令`git remote add origin git@github:username/reponame.git`；
4. 关联后，使用命令`git push -u origin master`第一次推送`master`分支的所有内容；
5. 此后，每次本地提交后，就可以使用命令`git push origin master`推送最新修改
