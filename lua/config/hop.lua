local ok, hop = pcall(require, 'hop')
if not ok then
  return
end

hop.setup()

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>hw', [[:HopWord<cr>]], opts)
vim.api.nvim_set_keymap('n', '<leader>ha', [[:HopLine<cr>]], opts)
