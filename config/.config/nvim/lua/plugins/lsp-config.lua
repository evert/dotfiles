return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.ts_ls.setup({})
    end,
    keys = {
      {
        '<C-d>',
        function()
          vim.diagnostic.open_float()
        end,
        desc = 'Open error screen'
      }
    }
  },
}
