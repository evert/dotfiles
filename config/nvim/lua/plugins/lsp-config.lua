return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Optional: configure capabilities (for completion plugins like nvim-cmp)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- Uncomment this if using nvim-cmp
      -- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- Global on_attach function for keymaps
      local on_attach = function(client, bufnr)
        local buf_map = function(lhs, rhs, desc)
          vim.keymap.set('n', lhs, rhs, { buffer = bufnr, desc = desc })
        end

        buf_map('<C-d>', vim.diagnostic.open_float, 'Open error screen')
        buf_map('<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
        buf_map('<leader>ca', vim.lsp.buf.code_action, 'Code action')
        buf_map('<leader>gd', vim.lsp.buf.definition, 'Go to definition')
        buf_map('<leader>gr', vim.lsp.buf.references, 'Find references')
      end

      -- Configure tsserver (ts_ls) using the new API
      vim.lsp.config.ts_ls = {
        on_attach = on_attach,
        capabilities = capabilities,
        -- settings = { ... } -- Add any server-specific settings here
      }

      -- Enable the server
      vim.lsp.enable("ts_ls")
    end,
  },
}
