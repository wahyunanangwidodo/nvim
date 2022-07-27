local ok, autopairs = pcall(require, 'nvim-autopairs')
if not ok then
  return
end

autopairs.setup({
  check_ts = true,
  close_triple_quotes = true,
})
