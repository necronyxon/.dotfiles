-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[ packadd packer.nvim ]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins when file is saved
vim.cmd([[ 
	augroup packer_user_config
	    autocmd!
	    autocmd BufWritePost packer.lua source <afile> | PackerSync
	augroup end
]])

local status, packer = pcall(require, "packer")
if not status then return end

return packer.startup(function(use)
  -- packer & dependencies
  use("wbthomason/packer.nvim") -- packer can manage itself
  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

  -- quality of life plugins
  use("lewis6991/impatient.nvim") -- open nvim faster
  use("kylechui/nvim-surround") -- add, delete, change surroundings
  use("numToStr/Comment.nvim") -- comment using gc
  use('mbbill/undotree') -- undotree
  use("nvim-tree/nvim-tree.lua") -- file explorer

  -- appearance
  use("nvim-lualine/lualine.nvim") -- status line
  use("Mofiqul/dracula.nvim") -- dracula colorscheme
  use("ellisonleao/gruvbox.nvim")
  use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

  -- code highlighting
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

  -- LSP
  use({ 'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  })

  if packer_bootstrap then require("packer").sync() end
end)
