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
vim.bo.tabstop = 8
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 2

vim.cmd('colorscheme gruvbox')

vim.g.mapleader = ','

vim.api.nvim_set_keymap('n', '<Leader><Space>', ':nohlsearch<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true })

-- treesitter
require'nvim-treesitter.configs'.setup {}

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

-- lualine
require('lualine').setup()
