local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
   use {'ms-jpq/coq_nvim', branch = 'coq'}
   use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
   use {'ms-jpq/coq.thirdparty', branch = '3p'}
   use {'folke/tokyonight.nvim', branch = 'main'}
   use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }
   }
end)

vim.cmd[[let g:coq_settings = { 'auto_start': 'shut-up' }]]

local lsp = require "lspconfig"
local coq = require "coq" -- add this

require'lspconfig'.ccls.setup{}                              -- before
lsp.ccls.setup(coq.lsp_ensure_capabilities()) -- after

require'lspconfig'.pyright.setup{}                              -- before
lsp.pyright.setup(coq.lsp_ensure_capabilities()) -- after

-- Lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

vim.g.tokyonight_style = 'night'
vim.g.tokyonight_transparent = true
vim.cmd[[colorscheme tokyonight]]

vim.cmd[[set number]]
vim.cmd[[set expandtab]]
vim.cmd[[set shiftwidth=4]]
vim.cmd[[set autoindent]]
vim.cmd[[set smartindent]]
vim.cmd[[filetype plugin on]]
vim.cmd[[set clipboard=unnamedplus]]
