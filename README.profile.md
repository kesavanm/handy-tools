### Requirements

This section is to cover the apps & tools to be installed on a new GNU device to run day-to-day life.

#### Additional deps:
```sh
	# basic
	sudo apt update

	# tools
	sudo apt install autoconf build-essential curl wget dos2unix gcc git
	sudo apt install libncurses-dev make
	sudo apt install make-guile x11-xserver-utils net-tools

	# media
	sudo apt install ffmpeg

	# funtime
	sudo apt install bat cowsay fortune lolcat sl
	sudo apt install toilet sysvbanner figlet boxes

	# extra
	sudo apt install ncdu
```

To consider
* `icdiff` - Show (colorized) differences between files in a two column view.
* `lsd` Grab from [Peltoche/lsd](https://github.com/Peltoche/lsd). This works good with [patched DejaVuSansMono](https://github.com/ryanoasis/nerd-fonts/releases/latest/download/DejaVuSansMono.tar.xz). Checkout more [icon patched fonts](https://github.com/ryanoasis/nerd-fonts).

#### GUI deps
```sh
	# productivity
	sudo apt install gvim

	# misc
	sudo apt install gedit gedit-plugins python3-markdown
```
### `gedit` extra plugins:

few of my favorite plugins to increase `gedit`

|#|plugin|github/source
|-|-|-
|1|restore tabs|`raelgc/gedit-restore-tabs`
|2|markdown preview|`aliva/gedit-markdownpreview`
