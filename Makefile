# Makefile to install .home on the target system

# destination path
DEST_PATH = $(HOME)/.home

# files to delete from $HOME
DOT_FILES = $(HOME)/.zshrc $(HOME)/.gemrc $(HOME)/.screenrc $(HOME)/.gitconfig

# prezto Repository to be used
PREZTO_REPO = https://github.com/sorin-ionescu/prezto.git

# local .zshrc (gets inserted into .zshrc for local specialities)
LOCAL_SETTINGS_FILE = $(HOME)/.local.zshrc

THEME = prompt_domnikl_setup

BUNDLE_BIN = `which bundle`



install: $(HOME)/.prezto clean $(DOT_FILES) theme $(LOCAL_SETTINGS_FILE) completions gems help
	
clean:
	@echo "cleaning dotfiles ..."
	rm -f $(DOT_FILES)

help:
	@echo "done"
	@echo 
	@echo " => run 'chsh -s' to change your used shell to activate settings"

completions:
	@echo "downloading git flow completions for zsh ..."
	@wget -q -nc https://raw.github.com/bobthecow/git-flow-completion/master/git-flow-completion.zsh

# target to clone prezto repository
$(HOME)/.prezto:
	git clone $(PREZTO_REPO) $(HOME)/.prezto
	cd $(HOME)/.prezto
	git submodule update --init --recursive

# sym links
$(HOME)/.zshrc:
	ln -s $(DEST_PATH)/.zshrc $(HOME)/.zshrc

$(HOME)/.gemrc:
	ln -s $(DEST_PATH)/.gemrc $(HOME)/.gemrc

$(HOME)/.screenrc:
	ln -s $(DEST_PATH)/.screenrc $(HOME)/.screenrc

$(HOME)/.gitconfig:
	ln -s $(DEST_PATH)/.gitconfig $(HOME)/.gitconfig

theme:
	ln -fs $(DEST_PATH)/themes/$(THEME) $(HOME)/.prezto/modules/prompt/functions/$(THEME)

gems:
	@echo "installing gems ..."
	$(BUNDLE_BIN) install

# local settings file
$(LOCAL_SETTINGS_FILE):
	touch $(LOCAL_SETTINGS_FILE)
