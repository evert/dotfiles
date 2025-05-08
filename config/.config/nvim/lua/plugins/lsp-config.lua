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
      },
      {
        '<leader>rn',
        function()
          vim.lsp.buf.rename()
        end,
        desc = 'Rename symbol'
      },
      {
        '<leader>ca',
        function()
          vim.lsp.buf.code_action()
        end,
        desc = 'Code action'
      },
      {
        '<leader>gd',
        function()
          vim.lsp.buf.definition()
        end,
        desc = 'Go to definition'
      },
      {
        '<leader>gr',
        function()
          vim.lsp.buf.references()
        end,
        desc = 'Find references'
      },
    }
  },
}
