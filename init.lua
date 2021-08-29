-- print('hello from init.lua')
-- vim.o.signcolumn = 'yes'

vim.go.ignorecase = true
vim.go.showcmd = true
vim.go.showmatch = true

vim.wo.list = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.scrolloff = 4
vim.wo.wrap = false

vim.bo.infercase = true
vim.bo.expandtab = true
vim.bo.shiftwidth = 2

vim.cmd('colorscheme gruvbox')

vim.g.mapleader = ','

vim.api.nvim_set_keymap('n', '<Leader><Space>', ':nohlsearch<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true })

-- highlight is extremely slow, disable for a moment
-- require'nvim-treesitter.configs'.setup {
--   highlight = {
--     enable = false,
--     -- additional_vim_regex_highlighting = false,
--   },
-- }

-- lsp-config
require'lspconfig'.hls.setup{}

-- lsp_signature
require "lsp_signature".setup()

-- nvim-compe
vim.o.completeopt = "menuone,noselect"
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  source = {
    path = true;
    nvim_lsp = true;
    buffer = true;
    nvim_lua = true;
  };
}

-- toggleterm
require("toggleterm").setup{}

-- lualine
require('lualine').setup()

-- hop
require('hop').setup()
vim.api.nvim_set_keymap('n', '<Leader>h', ':HopLineStart<CR>', { noremap = true })
