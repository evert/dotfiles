" Show vim-airline all the time
set laststatus=2

" VUNDLE stuff.
set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" PHP plugin
Plugin 'StanAngeloff/php.vim'

" Awesome statusline
Plugin 'bling/vim-airline'

" Vim debugging
Plugin 'joonty/vdebug'

call vundle#end()
filetype plugin indent on

" END OF VUNDLE stuff

