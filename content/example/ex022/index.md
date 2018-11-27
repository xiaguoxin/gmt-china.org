---
title: 绘制图中图
date: 2018-11-25
authors:
    - 王亮
images:
    - draw-inset-map.png
commands:
    -psbasemap
---

如果绘制的地图区域范围很小，读者可能不清楚所画区域的位置。
这种情况下，往往需要在地图的一角，绘制一个图中图表示区域的位置。

gmt 的 psbasemap 模块可以实现这一个需求。
绘图脚本：

{{< include-code "draw-inset-map.sh" bash >}}

绘图效果如下:

{{< figure src="draw-inset-map.png" title="东京湾" width="1000px">}}

psbasemap 的 -D 选项做的事是在地图上绘制一个插入用的图框（map insert box）。
-F 选项则是为这个图框绘制一个矩形的边界。
使用 -D 选项后就必须使用 -F 选项。
图中图内的内容就用 gmt 相应的模块绘制就是，和平时唯一的差就是要根据 -D 选项输出的位置信息进行调整。
下面说明脚本中这两个选项的具体含义。

-DjTL+w6c/7c+o0.2c/0.2c+stmp

1. -DjTL 定义的是图框放置的位置。TL 表示中间的左边。具体请读者了解 [gmt 的定位概念](https://docs.gmt-china.org/basic/embellishments/#id2)。
2. +w6c/7c 表示图框的大小为 6 厘米乘以 7 厘米。
3. +o0.2c/0.2i设置图框水平偏离 0.2c，垂直偏离 0.2c。
4. +stmp，把图中图的左下角的位置和尺寸输出到文件 tmp 中。后面绘制大地球需要使用其中的参数。

-F+gwhite+p1p+c0.1c+s

1. +gwhite表示填充白色
2. +p1p设置画笔的宽度为1p
3. +c0.1c是图中图中的图形和边框之间的空隙间隔。
4. +s绘制阴影

