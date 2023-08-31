" Don't load the built-in directory browser
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" Line numbers
set number
" Turn tabs into space characters
set expandtab
" Tabs are 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2 smarttab

" Default clipboard is OS clipboard
set clipboard+=unnamedplus

call plug#begin()

Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'folke/tokyonight.nvim'

call plug#end()

nnoremap <C-g> :NvimTreeToggle<CR>

colorscheme tokyonight

lua << EOF
local nmap = function(keys, func, desc)
  if desc then
    desc = 'LSP: ' .. desc
  end

  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end
vim.opt.termguicolors = true
nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

require("nvim-tree").setup()

require'lspconfig'.tsserver.setup {}
EOF
