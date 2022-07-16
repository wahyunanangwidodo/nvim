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