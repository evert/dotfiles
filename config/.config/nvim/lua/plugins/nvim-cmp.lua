return {
  "hrsh7th/nvim-cmp",

  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-emoji",
  },

  config = function()

    local cmp = require("cmp")
    cmp.setup({
      window = {
          -- Bordered windows
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "calc" },
        { name = "emoji" },
        { name = "cmdline" },
        { name = "buffer" },
      },
      mapping = {
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
      },
    });

    -- Set up lspconfig.
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    require("lspconfig").ts_ls.setup({
      capabilities = capabilities,
    })

  end 

};
