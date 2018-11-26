#!/bin/bash

PS=draw-inset-map.ps

gmt pscoast -R105E/165E/44S/9S -JM18c -P -Baf -BWSne -Wfaint -N2/1p -EAU+gbisque -Gbrown -Sazure1 -Da -K -Xc --FORMAT_GEO_MAP=dddF > $PS
gmt psbasemap -R -J -O -K -DjTR+w1.5i+o0.15i/0.1i+stmp -F+gwhite+p1p+c0.1c+s >> $PS

read x0 y0 w h < tmp
# x0 和 y0 是图中图左下角的坐标
# w 是图中图的款度
# h 是图中图的高度
gmt pscoast -Rg -JG120/30S/$w -Da -Gbrown -A5000 -Bg -Wfaint -EAU+gbisque -O -X$x0 -Y$y0 >> $PS
gmt psconvert $PS -A -Tg
rm tmp gmt.history $PS
