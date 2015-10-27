Evert's dotfiles
================

What you're looking at is a repository with my configuration files.
All my configuration is packed in the `config` directory, and in addition
there's several `make` commands that help me set everything up.

make targets
------------

* `make link`. Creates softlinks from the `config/` directory to `~`.
   files that already existing in `~` are ignored.
* `make install-packages`. Installs packages that are essential to my dev
   environment. This will only work on (k)ubuntu.
* `make oh-my-zsh`. Installs oh-my-zsh.
* `make vim`. Sets up the vim package manager and downloads all vim plugins.
* `make bin`. Installs binaries such as composer.
* `make install`. Does all of the above.

Configuration files
-------------------

This package currently ships configuration files for:

* [zsh](https://en.wikipedia.org/wiki/Z_shell). 
* [git](https://git-scm.com/).
* [vim](http://www.vim.org/).
* [tmux](https://tmux.github.io/).
 
