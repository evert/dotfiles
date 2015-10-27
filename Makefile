SHELL=/bin/sh
HOMEDIR=$(HOME)
THINGS_TO_LINK=.gitconfig .zshrc .tmux.conf .vimrc

all: link

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

install: install-packages oh-my-zsh link vim

install-packages:
	@sudo apt-get install -y vim git tmux zsh curl

oh-my-zsh:
	curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -o install-oh-my-zsh.sh;
	sh install-oh-my-zsh.sh
	rm install-oh-my-zsh.sh
	chsh -s /usr/bin/zsh

vim:
	mkdir -p $(HOMEDIR)/.vim/bundle
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

.PHONY: all install git link
