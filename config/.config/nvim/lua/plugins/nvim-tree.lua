return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { '<C-g>', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle nvim-tree' },
  },
  config = function()
    require("nvim-tree").setup {}
  end,
}
