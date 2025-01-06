" Don't load the built-in directory browser
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" Line numbers
set number
" Turn tabs into space characters
set expandtab
" Tabs are 2 spaces
set tabstop=2
"set softtabstop=2
set shiftwidth=2 smarttab

" Default clipboard is OS clipboard
set clipboard+=unnamedplus

set termguicolors
set t_Co=256

call plug#begin()

  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neovim/nvim-lspconfig'
  Plug 'folke/tokyonight.nvim'
  Plug 'brenoprata10/nvim-highlight-colors'

  " Auto complete
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  " LSP Rename dialog
  Plug 'nvim-lua/plenary.nvim'
  Plug 'filipdutescu/renamer.nvim', { 'branch': 'master' }

call plug#end()

" CTRL-G opens the file tree
nnoremap <C-g> :NvimTreeToggle<CR>

colorscheme tokyonight

" Bind rename to F2 in insert mode
inoremap <silent> <F2> <cmd>lua require('renamer').rename()<cr>
" rn in insert and visual mode
nnoremap <silent> <leader>rn <cmd>lua require('renamer').rename()<cr>
vnoremap <silent> <leader>rn <cmd>lua require('renamer').rename()<cr>

" This allows pasting multiple times. By default vim will replace the
" buffer after pasting which is annoying as hell.
"
" source: https://vi.stackexchange.com/questions/25259/clipboard-is-reset-after-first-paste-in-visual-mode 
xnoremap <expr> p 'pgv"'.v:register.'y`>'
xnoremap <expr> P 'Pgv"'.v:register.'y`>'

lua << EOF
local nmap = function(keys, func, desc)
  if desc then
    desc = 'LSP: ' .. desc
  end

  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end
vim.opt.termguicolors = true
nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

require("nvim-tree").setup({
  filters = { custom = { "^.git$" } }
})




require('nvim-highlight-colors').setup {}

  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  local lspconfig = require('lspconfig');
  lspconfig.ts_ls.setup {
    capabilities = capabilities
  }
  -- Go to definition
  vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })

  -- Go to declaration
  vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

  lspconfig.rust_analyzer.setup {
    -- Server-specific settings. See `:help lspconfig-setup`
    settings = {
      ['rust-analyzer'] = {},
    },
}

EOF

" Auto complete
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
