vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}
  -- use 'vim-airline/vim-airline'
  use 'neovim/nvim-lspconfig'
  use 'mfussenegger/nvim-dap'
  -- use {
  --   'nvim-lua/completion-nvim',
  --   requires = { {'hrsh7th/vim-vsnip' }, { 'hrsh7th/vim-vsnip-integ' } }
  -- }
  use 'tpope/vim-commentary'
  use 'neovimhaskell/haskell-vim'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'gruvbox-community/gruvbox'

end)
