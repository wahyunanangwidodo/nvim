local ok, marks = pcall(require, 'marks')
if not ok then
  return
end

marks.setup {
  default_mappings = true,
  force_write_shada = false,
  bookmark_0 = {
    sign = '⚑',
    virt_text = '',
  },
}
