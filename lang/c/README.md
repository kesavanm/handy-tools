
### GNU DDD 

Programming is fun if you can debug your code effectively. GNU DDD is a powerful GUI frontend for `GDB` tool to debug C/C++ and more programs

#### Installation
```bash
# basic tools
sudo apt install gcc gdb ddd xterm

# graphs & plots
sudo apt install plotutils gnuplot

# helpers & libs
sudo apt install build-essential cmake pkg-config flex bison \
    libx11-dev libxt-dev libxmu-dev libxext-dev \
    libxpm-dev libxft-dev libjpeg-dev libpng-dev \
    ninja-build ccache

# fonts
sudo apt install xfonts-100dpi
```


#### DDD Configuration

Edit the config file: `$HOME/.ddd/init`
```rb
! # disable splash screen and startup tips
Ddd*splashScreen: off
Ddd*startupTips: off

! # disable config auto overwrite
Ddd*saveOptionsOnExit: off

! # better UI
Ddd*renderTable: rt
Ddd*rt*fontType: FONT_IS_XFT
Ddd*rt*fontName: Inconsolata
Ddd*rt*fontSize: 8

! # Fonts.
! Ddd*defaultFont: helvetica-medium
! Ddd*variableWidthFont: helvetica-medium
! Ddd*fixedWidthFont: lucidatypewriter-medium
! Ddd*dataFont: lucidatypewriter-medium
Ddd*FontSize: 80

! # plot term type
Ddd*plotTermType: x11

! # display line numbers and save history on exit
Ddd*displayLineNumbers: on
Ddd*saveHistoryOnExit: on

! # Window sizes.
Ddd*graph_edit.height: 362
Ddd*source_text_w.columns: 103
Ddd*source_text_w.rows: 19
Ddd*code_text_w.columns: 1
Ddd*code_text_w.rows: 1
Ddd*gdb_w.columns: 103
Ddd*gdb_w.rows: 5

```

#### Gnuplot Configuration

Edit the config file: `$HOME/.gnuplot`

```sh
set xlabel 'Index'
set ylabel 'Values'
set grid xtics ytics

set style data boxes
set boxwidth 0.7 relative
set style fill solid 1.0
set linetype 1 lc rgb 'blue'
set yrange [0:*]

plot 'data' with boxes, '' using 0:1:1 with labels center offset 0,1, title
```

#### Troubleshooting

* If `gnuplot` struggle to render the plots/graphs or they disappear after a few seconds, try running it with disabling Window Manager effects(`compiz`) to force it to use the local display. You can do this by running in terminal:

    ```bash
    marco --replace & # or similar to disable compiz
    ```

