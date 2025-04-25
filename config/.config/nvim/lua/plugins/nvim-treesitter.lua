-- nvim-treesitter is a library that upgrades language parsing
-- the deeper understanding of my parsers AST should result in
-- smarter syntax highlighting with more context-awareness.
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
}
