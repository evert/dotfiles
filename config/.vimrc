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
Plugin 'StanAngeloff/php.vim'
Plugin 'bling/vim-airline'

call vundle#end()
filetype plugin indent on

" END OF VUNDLE stuff

