-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

function get_setup(name)
  return string.format('require("setup/%s")', name)
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'xiyaowong/nvim-transparent'

  use 'jiangmiao/auto-pairs'

  use "terrortylor/nvim-comment"

  -- use 'glepnir/dashboard-nvim'
 use {
      'goolord/alpha-nvim',
      -- config = get_setup("alpha")      
      config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
      end
  }
  
 use {
     'kyazdani42/nvim-tree.lua',
     requires = {
       'kyazdani42/nvim-web-devicons', -- optional, for file icon
     },
     config = function() require'nvim-tree'.setup {} end
 }

  use 'ap/vim-css-color'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { "nvim-telescope/telescope-file-browser.nvim" }

  use 'folke/tokyonight.nvim'
 
  -- Using Packer
  use 'navarasu/onedark.nvim'

  use 'arcticicestudio/nord-vim'

  use({
      'rose-pine/neovim',
      as = 'rose-pine',
      tag = 'v1.*',
  })

-- using packer.nvim
  -- use {
  --     'akinsho/bufferline.nvim', 
  --     requires = 'kyazdani42/nvim-web-devicons'
  --   }

-- use({
--     'noib3/nvim-cokeline',
--     requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
--     config = function()
--       require('cokeline').setup()
--     end
--   })
--

 -- use 'tamton-aquib/staline.nvim'

 use({
   "catppuccin/nvim",
    as = "catppuccin"
 })

end)
