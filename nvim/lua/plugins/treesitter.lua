require'nvim-treesitter.configs'.setup {
  ensure_installed = { "rust", "lua", "go", "cpp", "c", "python"},

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = false,
  },
}
