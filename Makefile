SHELL=/bin/sh
HOMEDIR=$(HOME)
THINGS_TO_LINK=.gitconfig .zshrc .tmux.conf .vimrc .dircolors .config/nvim 

UNAME := $(shell uname)

all: install

link:
	@for filename in $(THINGS_TO_LINK) ; do \
		if [ -e "$(HOMEDIR)/$$filename" ]; \
		then \
			echo "$$filename already exists"; \
		else \
			echo ln -s "$(shell pwd)/config/$$filename" "$(HOMEDIR)/$$filename"; \
			ln -s "$(shell pwd)/config/$$filename" "$(HOMEDIR)/$$filename"; \
		fi; \
	done

# Safe for re-running
install: link install-packages

# Contains stuff that cannot be safely re-run as well, and for now should only be ran the first time we're installing
fresh-install: install oh-my-zsh vim

install-packages:
ifeq ($(UNAME),Darwin)
	@echo "Darwin detected"
	brew install \
		vim \
		git \
		tig \
		tmux \
		zsh \
		curl \
		nodejs \
		npm \
		ack \
		reattach-to-user-namespace \
		wget \
		coreutils \
		htop
else ifneq (, $(shell which dnf))
	@echo Got a 'dnf' binary. Assuming fedora
	sudo dnf install \
		vim \
		git \
		tig \
		tmux \
		zsh \
		curl \
		nodejs \
		npm \
		ack \
		powerline tmux-powerline powerline-fonts \
		pv \
		mariadb-server \
		ksshaskpass \
		valkey
else
	@echo "Other linux detected. Assuming there's an apt binary."	
	sudo apt install -y \
		vim-gtk3 \
		git \
		tig \
		tmux \
		zsh \
		curl \
		mysql-server \
		tree \
		powerline \
		pv
endif

oh-my-zsh:
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

vim:
	mkdir -p $(HOMEDIR)/.vim/bundle
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

bin: install-packages
	mkdir $(HOMEDIR)/bin
	curl -sS https://getcomposer.org/installer | php -- --install-dir=$(HOMEDIR)/bin --filename=composer

neovim:
	sh -c 'curl -fLo "$${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	npm install -g typescript-language-server

.PHONY: all install git link
