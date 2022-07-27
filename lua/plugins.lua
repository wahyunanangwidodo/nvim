local ok, packer = pcall(require, 'packer')
if not ok then
  print('packer.nvim not found!')
  return
end

require('packer').init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end,
  },
  compile_path = vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua',
})

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  ----Plugins----
  use 'nathom/filetype.nvim'
  use 'lewis6991/impatient.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use { "nvim-lua/plenary.nvim", module = "plenary" }

  -- colorscheme
  use 'sainnhe/gruvbox-material'

  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('config.lualine')
    end,
  }

  -- buffer
  use {
    'akinsho/bufferline.nvim',
    config = function()
      require('config.bufferline')
    end,
  }

  -- git
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('config.gitsigns')
    end,
  }

  -- lsp
  use 'neovim/nvim-lspconfig'

  -- cmp
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      {
        "L3MON4D3/LuaSnip",
        requires = { "rafamadriz/friendly-snippets" },
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
    },
    config = [[require('config.cmp')]],
    event = 'InsertEnter *',
  }

  use {
    'onsails/lspkind-nvim',
    config = function()
      require("lspkind").init()
    end,
  }

  use 'ray-x/lsp_signature.nvim'

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('config.autopairs')
    end,
  }

  use { 'tpope/vim-surround' }

  use {
    "kyazdani42/nvim-tree.lua",
    requires = "nvim-web-devicons",
    config = function()
      require('config.nvim-tree')
    end,
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function() require "config.treesitter" end,
  }
  use { "windwp/nvim-ts-autotag", event = "InsertEnter" }

  use {
    "numToStr/Comment.nvim",
    keys = { "gcc", "gc", "gb" },
    config = function()
      require("Comment").setup {
        ignore = "^$",
      }
    end,
  }

  use {
    "phaazon/hop.nvim",
    config = function()
      require('config.hop')
    end,
  }

  use({
    'chentoast/marks.nvim',
    config = function()
      require('config.marks')
    end,
  })

  -- telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require('config.telescope')
    end,
  }

  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  }


  if packer_bootstrap then
    require('packer').sync()
  end
end)
