return {
  "hrsh7th/nvim-cmp",

  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    --"hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-emoji",
  },

  

  config = function()

    vim.opt.completeopt = { "menuone", "noselect" }
    local cmp = require("cmp")
    cmp.setup({
      completion = {
        completeopt = 'menu,menuone,noinsert',
        debounce = 500
      },
      window = {
          -- Bordered windows
          -- completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
      },
      sources = {
        --{ name = "copilot", group_index = 2 },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "calc" },
        { name = "emoji" },
        -- { name = "cmdline" },
        { name = "buffer" },
      },
      mapping = {
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping(function(fallback) 
          local col = vim.fn.col('.') - 1

          if not cmp.visible() then
            fallback()
          elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            fallback()
          else
            cmp.confirm({ select = true })
          end
        end),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
      },
    });

    -- Set up lspconfig.
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    vim.lsp.config.ts_ls = {
      capabilities = capabilities,
      -- You can also add on_attach or settings here
    }
    vim.lsp.enable("ts_ls")

  end 

};
