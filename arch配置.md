# 关于archlinux的配置 #

> linux版本：archlinux
>
> 桌面环境：kde plasma
>

## 1.本地化 ##
1. 在/etc/locale.gen中选择en_US.UTF-8和zh_CN.UTF-8,删除#号就可以
2. 非root用户执行sudo locale-gen，root下配置时执行locale-gen
3. 在/etc/locale.conf中写入LANG=zh_CN.UTF-8,没有这个文件时要自己创建
4. 新机器没有安装中文字体时，需要安装中文字体例如:wqy-microhei之类的
5. 做好上述配置后基本界面都会中文化
6. 注意firefox需要安装中文包

## 2.输入法配置 ##
1. 安装fcitx输入法引擎
2. 安装第三方输入法模块（例如：fcitx-googlepinyin），也可以直接使用内置输入法（会比较难用）
3. 安装kcm-fcitx,这是kde的fcitx输入法模块，安装他之后就可以配置fcitx
4. 在kde桌面打开fcitx配置软件，设置中文输入法
5. 重启系统
>  1. 上面是官方wkiki上的步骤，但是重启后有可能依然无法激活输入法
>
>  2. 在命令行输入fcitx -r
>
>  3. 我的提示设置XMODIFIERS环境变量
>
>  4. 两种方式设置这个环境变量：创建~/.xprofile或者在/etc/environment写入
>
>  5. 我这里选择的是后者，它是全局有效的变量
>
>  6. 写入内容:
>>  export GTK_IM_MODULE=fcitx
>>
>>  export QT_IM_MODULE=fcitx
>>
>>  export XMODIFIERS=@im=fcitx

## 3.配置archinuxcn ##
安装yaourt需要用到
> 
> [archlinuxcn]
> 
> SigLevel = Optional TrustAll
>
> Server   = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
>
> 必须配置SigLevel，否则yaourt安装文件时会出问题
> 

## 4.配置nvidia独立显卡的正确姿势 ##
1. 官方安装:  pacman  -S  nvidia  xorg-xrandr
2. 配置登录管理器 
> 
> sddm
> 
>>  nano /usr/share/sddm/scripts/Xsetup
>> 
>> ___________________________________________
>> 
>> xrandr --setprovideroutputsource modesetting NVIDIA-0
>> 
>> xrandr --auto
>> 
>
> gdm
>
>> /usr/share/gdm/greeter/autostart/optimus.desktop
>>
>> /etc/xdg/autostart/optimus.desktop
>> 
>> ____________________________________________________
>>
>> [Desktop Entry]
>> Type=Application
>>
>> Name=Optimus
>>
>> Exec=sh -c "xrandr --setprovideroutputsource modesetting NVIDIA-0; xrandr --auto"
>>
>> NoDisplay=true
>>
>> X-GNOME-Autostart-Phase=DisplayServer
>>
>  
+ 这里装机的时候没有安装intel集成显卡的驱动，直接从官方源中安装的nvidia官方闭源驱动。  
+ 看来不需要像官网文档中所说的，要配置xorg.conf这些文件。只需要配置sddm的启动脚本就可以。
+ 开机后可以通过`lspci -kv`命令查看是否有`kernel driver in use : nvidia`,我的机器有这么一行。
