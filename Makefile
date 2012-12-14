# Makefile to install .home on the target system

# destination path
DEST_PATH = $(HOME)/.home

# files to delete from $HOME
DOT_FILES = $(HOME)/.zshrc $(HOME)/.gemrc $(HOME)/.gitconfig $(HOME)/.zprofile $(HOME)/.zlogin $(HOME)/.zlogout $(HOME)/.zshenv $(HOME)/.zpreztorc $(HOME)/.coloritrc

# prezto Repository to be used
PREZTO_REPO = https://github.com/sorin-ionescu/prezto.git

# local .zshrc (gets inserted into .zshrc for local specialities)
LOCAL_SETTINGS_FILE = $(HOME)/.local.zshrc

THEME = prompt_domnikl_setup

BUNDLE_BIN = `which bundle`

PREZTO=.zprezto

install: $(HOME)/$(PREZTO) clean $(DOT_FILES) theme $(LOCAL_SETTINGS_FILE) gems completions help
	touch $(HOME)/.z
	
clean:
	@echo "cleaning dotfiles ..."
	rm -f $(DOT_FILES)

help:
	@echo "done"
	@echo 
	@echo " => run 'chsh -s' to change your used shell to activate settings"

gems:
	bundle install

completions:
	@echo "downloading git flow completions for zsh ..."
	@wget -q -nc https://raw.github.com/bobthecow/git-flow-completion/master/git-flow-completion.zsh

# target to clone prezto repository
$(HOME)/$(PREZTO):
	git clone --recursive $(PREZTO_REPO) $(HOME)/$(PREZTO)

# sym links


$(HOME)/.gemrc:
	ln -s $(DEST_PATH)/.gemrc $(HOME)/.gemrc

$(HOME)/.gitconfig:
	ln -s $(DEST_PATH)/.gitconfig $(HOME)/.gitconfig


$(HOME)/.coloritrc:
	ln -s $(DEST_PATH)/.coloritrc $(HOME)/.coloritrc



$(HOME)/.zshrc:
	ln -s $(DEST_PATH)/.zshrc $(HOME)/.zshrc

$(HOME)/.zpreztorc:
	ln -s $(DEST_PATH)/.zpreztorc $(HOME)/.zpreztorc

$(HOME)/.zshenv:
	ln -s $(DEST_PATH)/.zshenv $(HOME)/.zshenv

$(HOME)/.zlogin:
	ln -s $(DEST_PATH)/.zlogin $(HOME)/.zlogin

$(HOME)/.zlogout:
	ln -s $(DEST_PATH)/.zlogout $(HOME)/.zlogout

$(HOME)/.zprofile:
	ln -s $(DEST_PATH)/.zprofile $(HOME)/.zprofile

theme:
	ln -fs $(DEST_PATH)/themes/$(THEME) $(HOME)/$(PREZTO)/modules/prompt/functions/$(THEME)

# local settings file
$(LOCAL_SETTINGS_FILE):
	touch $(LOCAL_SETTINGS_FILE)
