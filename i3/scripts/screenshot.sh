#!/bin/bash

# 核心优化：稍微延迟 0.1 秒，等待用户释放快捷键，防止 X11 Grab 锁冲突
sleep 0.1

# 定制 slop 的线框外观 (One Dark 蓝色，线宽 2px，无半透明遮罩)
SLOP_ARGS="-f %g -b 2 -c 0.38,0.68,0.93,1"

case "$1" in
    "region")
        # 自由选区 -> 复制到剪贴板
        maim -u -g "$(slop $SLOP_ARGS)" | xclip -selection clipboard -t image/png -i
        ;;
    "window")
        # 捕获活动窗口 -> 复制到剪贴板
        maim -u -i $(xdotool getactivewindow) | xclip -selection clipboard -t image/png -i
        ;;
    "full")
        # 全屏瞬时捕捉 -> 复制到剪贴板
        maim -u | xclip -selection clipboard -t image/png -i
        ;;
    "save")
        # 自由选区 -> 存入本地 Pictures + 复制到剪贴板
        mkdir -p ~/Pictures
        FILE="$HOME/Pictures/src_$(date +%s).png"
        maim -u -g "$(slop $SLOP_ARGS)" "$FILE" && xclip -selection clipboard -t image/png -i "$FILE"
        ;;
esac
