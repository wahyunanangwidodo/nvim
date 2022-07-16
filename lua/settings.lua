local g = vim.g
local opt = vim.opt

g.mapleader = ' '

opt.mouse = 'a'
opt.wrap = false
opt.hidden = true
opt.number = true
opt.scrolloff = 9 
opt.numberwidth = 2
opt.showmode = false 
opt.cursorline = true
opt.signcolumn = 'yes:1'
opt.termguicolors = true
opt.relativenumber = true
opt.whichwrap = vim.o.whichwrap .. '<,>,h,l' 

opt.timeoutlen = 250
opt.updatetime = 250
opt.ttimeoutlen = 10
  
opt.tabstop = 4
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit"
opt.pumheight = 10
opt.completeopt = "menuone,noinsert,noselect" 
opt.fillchars = { eob = " "}
opt.swapfile = false
opt.undofile = true
opt.backup = false
opt.writebackup = false
opt.guifont = "FiraCode Nerd Font:h12"

g.gruvbox_material_transparent_background = 1
g.gruvbox_material_better_performance = 1

-- vim.cmd [[colorscheme gruvbox-material]]

g.did_load_filetypes = 1
g.loaded_python_provider = 0
g['python3_host_prog'] = "~/AppData/Local/Programs/Python/Python37-32/python.exe"  

local disabled_built_ins = {
    'netrw',
    'netrwPlugin',
    'netrwSettings',
    'netrwFileHandlers',
    'gzip',
    'zip',
    'zipPlugin',
    'tar',
    'tarPlugin',
    'getscript',
    'getscriptPlugin',
    'vimball',
    'vimballPlugin',
    '2html_plugin',
    'logipat',
    'rrhelper',
    'spellfile_plugin',
    'matchit',
}

for _, plugin in pairs(disabled_built_ins) do
g['loaded_' .. plugin] = 1
end

vim.cmd [[hi CursorLine guifg=none guibg=#2e2e2e]] 

opt.guicursor = {
  [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]],
  [[a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor]],
  [[sm:block-blinkwait175-blinkoff150-blinkon175]],
}
