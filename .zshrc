#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Dominik Liebler <liebler.dominik@googlemail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

source "$DOT_HOME/git-flow-completion.zsh"

# Customize to your needs...
source $DOT_HOME/.aliases
source $DOT_HOME/funcs.sh

set_editor

# load ~/.local.zshrc file, if it exists
if [ -f "$HOME/.local.zshrc" ]; then
	source $HOME/.local.zshrc
fi

# check for and install updates if available
update

if which fortune > /dev/null; then
    echo ""
    fortune $HOME/.home/fortunes/programming
fi
