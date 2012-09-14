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
	less $DOT_HOME/README.md
}