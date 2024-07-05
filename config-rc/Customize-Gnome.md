# Customize your Gnome

This doc is on what things to take care post-era of a fresh Gnu/Linux installation. Gnome being a popular choice for Desktop Environment, it's not my favorite decades back. Earlier days KDE was my choice when I used to work with **OpenSuSE** 

- [Customize your Gnome](#customize-your-gnome)
  - [Linux Desktop Environment](#linux-desktop-environment)
  - [Tools/Apps to make your Gnome as eye candy](#toolsapps-to-make-your-gnome-as-eye-candy)
    - [Panels](#panels)
    - [Conky](#conky)
    - [Plank](#plank)
    - [Compiz](#compiz)
    - [Themes \& Icons](#themes--icons)
    - [Fonts](#fonts)
    - [Cairo clock](#cairo-clock)
    - [Albert](#albert)


| KDE | Gnome |
| --- | --- |
| Better integration of applications | Better multi-monitor support |
| Better notification system | Better performance and resource usage |
| Better customization options | Better integration with other linux tools and applications |


## Linux Desktop Environment

Linux desktop environments are user interface software for Linux operating systems. These are the most popular desktop environments for Linux:

1. GNOME - Created by Red Hat, it is a fork of the earlier GIMP Development Environment. It is written in C and is released under the GNU General Public License. GNOME is available for various Linux distributions and is used by default in several Linux distributions.
2. KDE - Created by The K Desktop Project (KDE), it is another fork of the earlier K Desktop Environment. It is written in C++ and is released under the GNU Library General Public License (LGPL) and the Qt License. KDE is available for various Linux distributions and is used by default in some Linux distributions.

Gnome and KDE have been around since the early days of Linux. Gnome was created by Red Hat in 1997 and was initially called GIMP Development Environment (GDE). In 2000, the name was changed to GNOME (the name is an acronym for the GNU's Not-Only Mail). KDE was created by The K Desktop Project (KDE) in 1996 and was initially called K Desktop Environment (KDE).

Some stats around their usage:

* According to the [distrowatch.com](https://distrowatch.com/weekly.php?issue=20171016) website in October 2017, Gnome is used by 13.2% of Linux users and KDE is used by 8.3% of Linux users.
* According to the [w3techs.com](https://w3techs.com/technologies/overview/desktop_os/all) website as of October 2017, Gnome is used by 12.8% of the world's desktop and KDE is used by 7.5% of the world's desktop.

Here is a comparison of Gnome and KDE:

| Gnome | KDE |
| --- | --- |
| Focus on productivity and usability | Focus on user experience and customization |
| Easy to use | Steep learning curve |
| Good for beginners | More advanced features |
| Multi-platform | Multi-platform |
| Good for web developers | Good for designers |
| Better in terms of resource usage | Better in terms of resource usage |
| Easier to extend | More difficult to extend |

Over periods, I moved to **Trisquel Gnu/Linux** distro , and I stick with Gnome forever no matter what the OS is.


## Tools/Apps to make your Gnome as eye candy

### Panels
This `mate-panel` is one of the best thing in Gnome and you can customize adding the window list, workspace switcher to pinning your fav apps along with indicators & Classic menu. If your screen permits with big display, go for two panels, one on top and other at bottom. 

### Conky
Conky is a system monitor that can be customized to display information in a text window, allowing for real-time monitoring of system statistics such as CPU usage, memory usage, disk usage, temperature, and more. Conky is highly customizable and can be customized to display the information in a variety of formats such as text, graphs, and charts. Conky is very lightweight and resource-efficient, making it a great choice for older hardware.


### Plank
- Plank provides a Dock-like experience in Gnome, making it easier for linux users to switch between applications, documents, and web pages.
- Plank can be customized with custom docklets and provides a clean and organized user experience.
- Plank is lightweight and resource-efficient, making it a great choice for older hardware.
- Plank provides a seamless integration with Gnome Shell and other Gnome applications.

Plank makes life easy with docklets. You can pin you favorite docklets and 

The pain points from my experience is, I enabled `Lock Icons` under `Behaviour` and struggle to add more icons where things failed. So make sure the Lock Icons turned-off

### Compiz
- Compiz is a window manager and compositing manager for the X Window System, it enhances user experience by providing a wide range of features such as:
	* Desktop effects like: move, resize, minimize, maximize, close buttons, window title bar, window shadows, window borders, window decorations, window animations, window transparency, etc.
	* Window Management: window placement, window snapping, window tiling, window resizing, window maximizing, window minimizing, window cycling, window grouping, window stacking, window focus, etc.
	* Workspace Management: multiple workspaces, workspace switching, workspace cycling, workspace locking, workspace auto-switching, etc.
	* Animations: window move, window resize, window fade in/out, window animation, etc.
	* Easy customization: Compiz can be customized with various plugins and effects to meet the user's preferences.
	* Resource-efficient: Compiz is lightweight and resource-efficient, making it a great choice for older hardware.
	* Seamless integration: Compiz provides a seamless integration with Gnome Shell and other Gnome applications.
   
```bash
sudo apt install compiz-plugins-default compiz-plugins-main compiz-plugins-extra compiz-plugins compiz-plugins-main-default compiz-mate compizconfig-settings-manager
sudo ccsm         # config as sudo
```

- `Place Windows` >> Placement Mode - Centered
- `Effects` 
  - `Window Decoration*` - This is possible culprit for most cases
  - `Animations` >> `Magic Lamp Wavy` for both Minimize & Unminimize - Open sesame!

\* In-case if you still missing borders for windows , probabbly a distro upgrade may help.

**Pro-Tip:** Try `sudo ccsm` and config it, so changes may forced into system and reflect.

### Themes & Icons
If you notice few apps not honoring the selected theme in **Appearance** (`mate-appearance-properties`) particularly (McMojave-circle*-X or so), time to use the power. Install the theme under `/usr/share/themes/` with help of `sudo` and you should be good to go.

The same goes with Icons as well. In case of trouble, install the icon package at `/usr/share/icons`

### Fonts
If you're fan of `Powerline` & `Mono` fonts, cheers! Hope you can get it under `.icons` 
      - DejaVu Sans Mono for Powerline.ttf
      - DejaVu Sans Mono Nerd Font Complete Mono.ttf

My terminals lover them and my eyes thank them forever

### Cairo clock
Is your desk missing the fancy clock? Get that \`radium\` `Cairo clock` and ensure it stick to the right position every time you login. `~/.cairo-clockrc` is your friend. Feel free to ignore the Do not edit warning , but sure about what you're doing.

```bash
sudo dpkg -i cairo-clock_0.3.4-2ubuntu2_amd64.deb  #grab the binary
sudo apt install -f         # install deps if required during above
```

### Albert
One of the keyboard launcher, `Albert` is good choice for both Gnome/KDE. With Albert's fizzy-finding for anything, you need from the device, just matter of seconds.

```bash
sudo dpkg -i albert_0.17.6-0_amd64.deb  #grab the binary
sudo apt install -f         # install deps if required
```
