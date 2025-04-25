-- Install all kinds of Typescript tools
-- https://github.com/pmizio/typescript-tools.nvim
return {
  {
    "pmizio/typescript-tools.nvim",
    -- ft = { "typescript", "typescriptreact", "typescript.tsx" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
      -- "hrsh7th/nvim-cmp",
      -- "jose-elias-alvarez/null-ls.nvim",
    },
    -- config = function()
      -- require("typescript-tools").setup()
    -- end,
  },
}
