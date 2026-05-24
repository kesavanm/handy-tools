
### GNU DDD 

Simple, ancient but powerful GUI frontend for `GDB` tool to debug C/C++ and more programs

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


#### Configuration

Edit the config file: `$HOME/.ddd/init`
```rb
! # disable config auto overwrite
Ddd*saveOptionsOnExit: off

! # better UI
Ddd*renderTable: rt
Ddd*rt*fontType: FONT_IS_XFT
Ddd*rt*fontName: Inconsolata
Ddd*rt*fontSize: 8
```
