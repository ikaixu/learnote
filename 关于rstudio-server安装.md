# rstudio-server配置 #
1. 由于linux下，桌面版本的rstudio，会与输入法冲突，需要解决这一问题。比较好的方案是安装rstudio-server。  
2. 采用源代码编译安装，阅读源代码文件夹下的INSTALL文件，按照它的指导进行安装。  
3. 先安装依赖  
4. mkdir build  
5. cd build  
6. cmake  
7. sudo make install  
8. 其实在cmake过程中可能会出错，这时候怎么解决？一定要学会读错误文件。错误文件中一般会标记问题在哪里。我在本次安装过程中，反复出现的错误就是依赖没有安装好。这时候就要切换到，相应的目录安装依赖。  
9. 配置rstudio-server,最重要的就是按官方教程来，对于archlinux就是找到rstudio-server.service放到相应的位置。关于.service文件，可以放到两个位置/etc/systemd/system和/usr/lib/systemd/system。
