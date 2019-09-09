# 疑难问题

## 1.Gtk_warning** cannot open display:0.0
发现`jupyter notebook`无法使用，原因是无法调用浏览器。当在shell中输入`firefox &` 或者 `google-chrome-stable &`时候出现上述错误，由此导致`jupyter notebook`无法使用。弄了一下午，终于想起来了，是当初设置gtk默认后端为wayland导致的，删除原来设置的环境变量，终于解决问题。