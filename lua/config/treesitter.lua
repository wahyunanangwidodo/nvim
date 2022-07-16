
local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return
end

treesitter.setup({
  ensure_installed = "all",
  highlight = {
      enable = true,
      disable = { "html" },
  },
  indent = { enable = false },
  autopairs = { enable = true },
  autotag = { enable = true },
})
