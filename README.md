
```
Xft.dpi: 144
   Xft.autohint: 0
   Xft.lcdfilter: lcddefault
   Xft.hintstyle: hintfull
   Xft.hinting: 1
   Xft.antialias: 1
   Xft.rgba: rgb
Xcursor.theme: breeze_cursors
Xcursor.size: 64
```

这个配置文件是以这个 `.Xresources` 为基准的。如果xft.dpi调整到96,那么相应的，各程序的字体都要手动设置增大。本文件夹再附上foliate和readest的desktop文件，修改好的。

-------

> 1. 将同时下载的线程数从 3 调大到 15（大幅压榨带宽）
sudo dnf5 config-manager setopt max_parallel_downloads=15

> 2. 开启最快镜像站自动检测
sudo dnf5 config-manager setopt fastestmirror=1
