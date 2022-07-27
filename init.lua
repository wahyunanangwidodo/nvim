if not pcall(require, "impatient") then
  print "impatient.nvim not found!"
end

require('settings')
require('plugins')
