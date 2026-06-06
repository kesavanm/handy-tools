## Learn. Fun. Linux

Learning is fun. Linux is fun.

### Prerequisites
- Basic understanding of Linux commands
- Access to a Linux terminal


### Session 0: Introduction
- Understand the purpose of the session
- Set up the environment

To install a new command, use the following command:
```bash
sudo apt install <command_name>
```

### Session 1: Basic Commands
- Learn basic Linux commands
- Practice using the terminal


|#|Command|Description|Example|
|-|-|-|-|
|1|`ls`| **list** files and directories|`ls -l`|
|2|`cd`|**change directory**|`cd /home/user`|
|3|`pwd`|**print working directory**|`pwd`|
|4|`uname`|What is the (OS/your) **u name**?|`uname -a`|
|5|`whoami`|Print effective user ID.  **Who Am I**?|`whoami`|
|6|`mkdir`|**Make directory**|`mkdir my_directory`|
|7|`touch`|**Create empty files or update timestamps**|`touch my_file.txt`|
|8|`rm`|**Remove files and directories**|`rm my_file.txt`|
|9|`cp`|**Copy** files and directories|`cp my_file.txt new_file.txt`|
|10|`mv`|**Move**/rename files and directories|`mv my_file.txt /path/to/new/location`|
|11|`cat`|**Concatenate** and display files|`cat my_file.txt`|
|12|`head`|Display **head** (first) of file|`head my_file.txt`|
|13|`tail`|Display **tail** (last) of file|`tail my_file.txt`|
|14|`find`|**find** (search) for files|`find /path/to/search -name "*.txt"`|
|15|`who`|Show **who** is logged in|`who`|
|16|`w`|Show **who** is logged in and what they are doing|`w`|
|17|`date`|Display the current **date** and time|`date`|
|18|`cal`|Display a **calendar**|`cal 2025`|
|19|`bc`|An arbitrary precision **bench calculator** language|`bc <<< "2+2"`|
|20|`history`| Display my **history** of commands|`history`|
|21|`man`|Display **manual** pages|`man ls`|
|22|`chmod`| **Change Mode** to update file permissions|`chmod +x stupid.sh`|

### Special Characters
| Command | Description | Example |
| --- | --- | --- |
| `>` | **Redirect** (store) output to a file | `history > output.txt` |
| `>>` | **Append** (add) output to a file | `cat mom_loves_you.txt >> output.txt` |
| `\|` | **Pipe** output to another command | `history \| head -10` |


### Special place
 `~` :  **Home directory**

| Example | Description |
| --- | --- |
| `cd ~` | Change to home directory | 
| `find ~ -iname "*.txt"` | Find files with .txt extension in home directory | 




### More specials
| Symbol | Description | Example |
| --- | --- | --- |
| `~` | Home directory | `cd ~` |
| `-` | Previous directory | `cd -` |
| `..` | Parent directory | `cd ..` |
| `.` | Current directory | `cd .` |
| `*` | Wildcard | `ls *.txt` |
| `?` | Single character wildcard | `ls file?.txt` |
| `;` | Command separator | `ls; cd /home` |
| `&&` | AND operator | `ls && cd /home` |
| `\|\|` | OR operator | `ls \|\| echo "Failed"` |
| `&` | Run command in background | `sleep 10 &` |
| `!` | History expansion | `!!` |
| `#` | Comment | `# This is a comment` |
| `$` | Variable expansion | `$HOME` |
| `"` | Double quotes | `"Hello World"` |
| `'` | Single quotes | `'Hello World'` |
| `\` | Escape character | `ls file\ with\ spaces.txt` |


### Special Placeholders
| Command | Description | Example |
| --- | --- | --- |
| `$?` | Exit status of last command | `echo $?` |
| `$_` | Last argument of previous command | `ls /home/user` then `$_` |
| `$$` | Process ID of current shell | `echo $$` |
| `$!` | Process ID of last background command | `sleep 10 &` then `$!` |


### Session 2: File Operations
- Learn file operations
- Practice using the terminal

### Editor - `nano`
| Command | Description | Example |
| --- | --- | --- |
| `nano` | Simple text editor | `nano stupid.sh` |
| `CTRL+S` | Save file in nano | `CTRL+S` |
| `CTRL+X` | Exit nano | `CTRL+X` |


| Command | Description | Example |
| --- | --- | --- |
| `&` | Run command in background | `sleep 10 &` |
| `;` | Separate commands | `ls ; cd /home` |
| `&&` | Run command if previous command succeeded | `ls && cd /home` |
| `\|\|` | Run command if previous command failed | `ls \|\| echo "Failed"` |




### Session 3: Fun Commands
The following commands will be used to learn and have fun with Linux.

| # | Command | Description | Example |
| --- | --- | --- | --- |
| 1 | `sl` | Show a steam train running across your terminal | `sl` |
| 2 | `cowsay` | Make a cow say something | `cowsay "Hello World"` |
| 3 | `fortune` | Print a random fortune | `fortune` |
| 4 | `lolcat` | Colorize output | - |
| 5 | `toilet` | Print large text | - |
| 6 | `sysvbanner` | Print large text | - |
| 7 | `figlet` | Print large text | - |
| 8 | `boxes` | Print text in boxes | - |


### Session 4: Math Commands
Learn some math commands like `bc expr pi` for basic calculations.

Start with `bc` command and practice basic arithmetic operations.

```bash
bc
45+65
110
x=45
y=67
x*y
3015
x = 3
y = 72 / x
y
24
```
```bash
expr 45 + 54
expr 45 \* 89
expr 45 '*' 99
```

> [!TIP] 
> Try: `pi 50`

**Combination**
`echo "45 * $(pi 5)" | bc -l`


### Session 5: Commands - Advanced

| # | Command | Description | Example |
|---|---|---|---|
| 1 | `chown` | Change file ownership | `chown user file.txt` |
| 2 | `chgrp` | Change file group | `chgrp group file.txt` |
| 3 | `less` | View files | `less file.txt` |
| 4 | `more` | View files | `more file.txt` |
| 5 | `grep` | Search for patterns in files | `grep word file.txt` |
| 6 | `kill` | Send a signal to a process | `kill PID` |
| 7 | `killall` | Kill processes by name | `killall process_name` |
| 8 | `pkill` | Kill processes by name | `pkill process_name` |
| 9 | `ps` | Report a snapshot of current processes | `ps aux` |
| 10 | `top` | Display Linux processes | `top` |
| 11 | `htop` | Interactive process viewer | `htop` |
| 12 | `free` | Display amount of free and used memory | `free` |
| 13 | `df` | Report file system disk space usage | `df -h` |
| 14 | `du` | Estimate file space usage | `du -h file.txt` |
| 15 | `info` | Read documentation | `info command` |
| 16 | `whatis` | Display one-line manual page descriptions | `whatis command` |
| 17 | `whereis` | Locate the source and binary files for a command | `whereis command` |
| 18 | `which` | Locate a command | `which command` |
| 19 | `time` | Time command execution | `time command` |
| 20 | `locate` | Find files by name | `locate filename` |

