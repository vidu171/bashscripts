# Shell scripts
Some of my personal Scripts


## 1. Ion Login

This Script allows you to login to ION (Manipal Universities Internet Provider).
Note that this Script is only for Manipal University Users.

### 1 a. Requirements


```sh
$ sudo apt-get install cowsay
$ sudo apt-get install lolcat
```
### 1 b. Setup to run through terminal

Add the following Line to `~/.bashrc` or `~/.zshrc` (for zsh) 

```sh
source ~/path/to/ion/script.sh 
```

then login by typing

```sh
$ ilogin 
```
and to Log out type 

```sh
$ ilogout 
```
### 1 b. Setup to run as a shortcut

for ubuntu go to setings>Devices>Keyboards and add shortcut 
in the command field add the path to shortcut script
```sh
~/path/to/ion/shortcut/script.sh 
```



