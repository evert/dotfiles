" Show line numbers
set number

" Show vim-airline all the time
set laststatus=2

" 256 colors
let t_Co=256

" Turning on syntax highlighting, if it was off.
syntax enable

" Size of a 'hard tab'
set softtabstop=2

" Size of an indent
set shiftwidth=2

" Use spaces for tabs
set expandtab

" Incremental search
set incsearch

" Highlight search
" set hlsearch

" Don't do folding
set nofoldenable

" My preference is to not wrap
set nowrap

" Automatically get changes if file changed on disk
set autoread 

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

" Turn on ALE completion
let g:ale_completion_enabled = 1


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
Plugin 'preservim/vim-markdown'

" Typescript
Plugin 'leafgarland/typescript-vim'

" Required for tobyS/pdv
Plugin 'tobyS/vmustache'

" PHP docbloc plugin
" Plugin 'tobyS/pdv'

" Go plugin!
Plugin 'fatih/vim-go'

" Neocomplete
" Plugin 'Shougo/neocomplete.vim'

" ctrlp
Plugin 'ctrlpvim/ctrlp.vim'

" Ayu theme
Plugin 'ayu-theme/ayu-vim'

" Autocomplete
" Plugin 'Valloric/YouCompleteMe'

" Also autocomplete
Plugin 'dense-analysis/ale'

" Retro groove color scheme for Vim
Plugin 'morhetz/gruvbox'

" CSS color highlighting
Plugin 'ap/vim-css-color'

" Code coverage
Plugin 'ruanyl/coverage.vim'

" Better javascript
Plugin 'pangloss/vim-javascript'

" Typescript and vim
Plugin 'peitalin/vim-jsx-typescript'

" Dracula theme
Plugin 'dracula/vim', { 'name': 'dracula' }

Plugin 'frazrepo/vim-rainbow'

call vundle#end()
filetype plugin indent on

" END OF VUNDLE stuff

" Support frontmatter in markdown files
let g:vim_markdown_frontmatter = 1

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"

" Show buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

" Powerline fonts for vim-airline
let g:airline_powerline_fonts = 1

set termguicolors
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

set background=dark
colorscheme dracula

" Use \ in normal mode to find definition
nmap \ :ALEGoToDefinition<CR>

" Use t in normal mode to open NERDtree.
nmap t :NERDTree<CR>

let g:coverage_json_report_path = 'coverage/coverage-final.json'


let g:rainbow_active = 1

" ALE config
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️:'


" tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
