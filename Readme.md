# .home

These are my dotfiles to set preferences for zsh and some handy commands for everyday usage.

## Installation

Installation is very simple, you just have to clone this repository to your home dir and run `make install`:

```bash
git clone git://github.com/domnikl/.home.git $HOME/.home
cd $HOME/.home && make install
```

The setup script will then clone the [prezto](https://github.com/sorin-ionescu/prezto) repository (if necessary) and create a symlink in your home dir .zshrc to adjust $PATH as well as set zsh preferences.

## Commands

* `+x` 				    chmod +x alias
* `git up` 			  show information about changes after pulling, params like git-pull
* `git reup` 		  as git up, but does git pull --rebase
* `git wtf` 		  show sync information
* `git record` 		record coding dojo, uses streamer to create pictures of the committer, if available
* `git deleteit` 	git rm on all deleted files
* `git ignore` 	  add $1 to .gitignore
* `git current`   prints the name of the current branch
* `git fix` 	    rebase current branch by comparing it with the remote tracking branch (with the same name)
* `git cs`		    open interactive cheatsheet in the browser
* `github`        open the current Github project in Chrome or another browser
* `grep-assets`   grep Apache2 log for requested assets
* `to_mp3` 			  download videos via youtube-dl and convert to mp3 via ffmpeg
* `convert_mp3`   convert all non-mp3 files in a directory to mp3
* `lyrics` 			  show the lyrics to the song currently playing in iTunes
* `loadaverage`   print load average data
* `psgrep` 			  grep `ps aux` output
* `shoot` 			  take a snapshot from a webcam
* `ctail`         a colored `tail -f`, run `ctail -h` for more info

## Aliases

* `l` 			   ls -lah
* `dg`			   show free disk space (`df`) only with relevant mounts
* `g` 			   git
* `gs` 			   git status
* `gh` 			   open my github profile in Chrome
* `gpom` 		   git push origin master
* `phpstorm` 	 starts PhpStorm
* `ns` 			   grep for TCP or UDP connections
* `feierabend` do shutdown -h now
* `zstats`     print most used commands from ZSH's history

## Directory Hashes

* `~w` 		  ~/Workspace
* `~t` 		  ~/Workspace/talks
* `~app` 	  /var/www/app
* `~log` 	  /var/log
* `~init` 	/etc/init.d

