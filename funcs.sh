set_editor() {
        if [[ `which mate 2>&1` != *"not found"* ]]; then
                E=`which mate`
        elif [[ `which vim 2>&1` != *"not found"* ]]; then
                E=`which vim`
        else
                E=`which vi`
        fi

        export EDITOR=$E
}

# display help for lost devs ...
help() {
	less "$DOT_HOME/Readme.md"
}

update() {
	UPDATE_FILE=~/.dotfiles_update
	INTERVAL=2

	TODAY=`date +%Y%m%d`
	((UPDATE_SHOULD = $TODAY - $INTERVAL))

	echo "checking for update ..."

	touch $UPDATE_FILE
	LAST_UPDATE=`cat "$UPDATE_FILE"`
	
	if [ "$LAST_UPDATE" = "" ]; then
		# 1st update
		echo $TODAY >! $UPDATE_FILE
	elif [ "$LAST_UPDATE" -lt "$UPDATE_SHOULD" ]; then
		# do update
		echo "last update was $LAST_UPDATE"
		echo "updating via git ..."
		update_via_git
		echo $TODAY >! $UPDATE_FILE
	else
		echo "nothing to do"
		echo "Have a nice day!"
	fi
}

update_via_git() {
    pushd $HOME/.home

    git stash save > /dev/null
	git pull --rebase origin master
	git stash apply > /dev/null

	popd
}
