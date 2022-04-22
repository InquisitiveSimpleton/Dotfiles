local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
   use {'ms-jpq/coq_nvim', branch = 'coq'}
   use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
   use {'ms-jpq/coq.thirdparty', branch = '3p'}
   use {'folke/tokyonight.nvim', branch = 'main'}
   use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}

   -- nvim-tree
   use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end}

    use 'mhinz/vim-signify'

end)

function get_setup(name)
    return require(string.format("setup/%s", name))
end

get_setup("lualine")
get_setup("coq_lsp")
get_setup("nvim-tree")
