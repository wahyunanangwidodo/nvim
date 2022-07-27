local ok, bufferline = pcall(require, 'bufferline')
if not ok then
  return
end

bufferline.setup({
  options = {
    numbers = 'none',
    close_icon = '',
    modified_icon = '●',
    indicator_icon = '▎',
    left_trunc_marker = '',
    buffer_close_icon = '',
    right_trunc_marker = '',
    enforce_regular_tabs = true,
    show_buffer_close_icons = true,
    always_show_bufferline = true,
    max_prefix_length = 15,
    max_name_length = 18,
    tab_size = 18,
  },
})


local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<TAB>', [[<Cmd>BufferLineCycleNext<CR>]], opts)
vim.api.nvim_set_keymap('n', '<S-TAB>', [[<Cmd>BufferLineCyclePrev<CR>]], opts)
vim.api.nvim_set_keymap('n', 'gb', '<cmd>BufferLinePick<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>bdelete!<cr>', opts)
