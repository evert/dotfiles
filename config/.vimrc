" Show line numbers
set number

" Show vim-airline all the time
set laststatus=2

" 256 colors
let t_Co=256

" Turning on syntax highlighting, if it was off.
syntax enable

" Size of a 'hard tab'
set tabstop=4

" Size of an indent
set shiftwidth=4

" Use spaces for tabs
set expandtab

" Automatically open NERDTree when hitting Ctrl-n
map <C-n> :NERDTreeToggle<CR>


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

" File explorer
Plugin 'scrooloose/nerdtree'

" NERDTree git integration
Plugin 'Xuyuanp/nerdtree-git-plugin'

call vundle#end()
filetype plugin indent on

" END OF VUNDLE stuff

