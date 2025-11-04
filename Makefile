SHELL=/bin/sh
HOMEDIR=$(HOME)
CONFIGDIR=$(HOMEDIR)/.config

UNAME := $(shell uname)

all: install

link:
	@for filename in config/* ; do \
		bn=$$(basename $$filename); \
		target="$(CONFIGDIR)/$$bn"; \
		if [ -e "$$target" ]; then \
			echo "Link $$target already exists, skipping"; \
	  else \
			echo ln -s "$(shell pwd)/$$filename" "$$target"; \
			ln -s "$(shell pwd)/$$filename" "$$target"; \
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
		ack \
		curl \
		direnv \
		fzf \
		git \
		nodejs \
		npm \
		powerline tmux-powerline powerline-fonts \
		pv \
		tig \
		tmux \
		vim \
		zsh
		#mariadb-server \
		#ksshaskpass \
		#valkey
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
	ZSH=~/.local/share/oh-my-zsh sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

vim:
	mkdir -p $(CONFIGDIR)/vim/bundle
	git clone https://github.com/VundleVim/Vundle.vim.git ${CONFIGDIR}/vim/bundle/Vundle.vim

bin: install-packages
	mkdir $(HOMEDIR)/bin
	curl -sS https://getcomposer.org/installer | php -- --install-dir=$(HOMEDIR)/bin --filename=composer

neovim:
	sh -c 'curl -fLo "$${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	npm install -g typescript-language-server

.PHONY: all install git link
