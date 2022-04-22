local lsp = require "lspconfig"
local coq = require "coq" -- add this

require'lspconfig'.ccls.setup{}                              -- before
lsp.ccls.setup(coq.lsp_ensure_capabilities()) -- after

require'lspconfig'.pyright.setup{}                              -- before
lsp.pyright.setup(coq.lsp_ensure_capabilities()) -- after

