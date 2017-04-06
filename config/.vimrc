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

" Incremental search
set incsearch

" Highlight search
" set hlsearch

" Don't do folding
set nofoldenable

" Automatically open NERDTree when hitting Ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Remember the last position of the file we were in
" VimTip 80: Restore cursor to file position in previous editing session
" for unix/linux/solaris
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


" VUNDLE stuff.
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set clipboard=unnamedplus

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

" Better markdown support
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Required for tobyS/pdv
Bundle 'tobyS/vmustache'

" PHP docbloc plugin
Bundle 'tobyS/pdv'

" Go plugin!
Bundle 'fatih/vim-go'

" Neocomplete
Bundle 'Shougo/neocomplete.vim'

call vundle#end()
filetype plugin indent on

" END OF VUNDLE stuff

" Support frontmatter in markdown files
let g:vim_markdown_frontmatter = 1

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-p> :call pdv#DocumentCurrentLine()<CR>

" Show buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

" Powerline fonts for vim-airline
let g:airline_powerline_fonts = 1
