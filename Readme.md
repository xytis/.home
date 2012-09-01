# .home

These are my dot files to set preferences for zsh and some handy commands for everyday usage.

## Installation

Installation is very simple, you just have to clone this repository to your home dir and run `make install`:

```bash
git clone git://github.com/domnikl/.home.git $HOME/.home
cd $HOME/.home && make install
```

The setup script will then clone the [prezto](https://github.com/sorin-ionescu/prezto) repository (if necessary) and create a symlink in your home dir .zshrc to adjust $PATH as well as set zsh preferences.

## Commands

* `+x` chmod +x alias
* `git up` show information about changes after pulling, params like git-pull
* `git reup` as git up, but does git pull --rebase
* `git wtf` show sync information
* `git record` record coding dojo, uses streamer to create pictures of the committer, if available
* `git deleteit` git rm on all deleted files
* `grep-assets` grep Apache2 log for requested assets
* `minify` minify CSS and JS files
* `to_mp3` Download videos via youtube-dl and convert to mp3 via ffmpeg
* `convert_mp3` Convert all non-mp3 files in a directory to mp3
* `lyrics` show the lyrics to the song currently playing in iTunes

## Aliases

* `l` ls -lah
* `g` git
* `gs` git status
* `gpom` git push origin master
* `start-storm` starts PHPStorm
* `ns` grep for TCP or UDP connections
* `poweroff` do shutdown -h now

## Directory Hashes

* `~w` ~/Workspace
* `~t` ~/Workspace/talks
* `~app` /var/www/app
* `~log` /var/log
* `~init` /etc/init.d

