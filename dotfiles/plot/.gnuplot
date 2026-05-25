set xlabel 'Index'
set ylabel 'Values'
set grid xtics ytics

set style data boxes
set boxwidth 0.7 relative
set style fill solid 1.0
set linetype 1 lc rgb 'blue'
set yrange [0:*]

plot 'data' with boxes, '' using 0:1:1 with labels center offset 0,1, title