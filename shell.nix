{self,  pkgs ? import <nixpkgs> {} }:
with pkgs;
let
  neovim = pkgs.neovim.override {
    withRuby = false;
    configure = {
      customRC = ''
        let g:loaded_perl_provider = 0
        source ${self}/init.lua

        " nvim-compe
        inoremap <silent><expr> <C-Space> compe#complete()
        inoremap <silent><expr> <CR>      compe#confirm('<CR>')
        inoremap <silent><expr> <C-e>     compe#close('<C-e>')
        inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
        inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

        autocmd BufReadPost * exec "normal g'\""
      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
      # youtube.com/watch?v=P9jB7mz2Ax4
        start = [
          gruvbox
          lsp_signature-nvim
          lualine-nvim
          nvim-compe
          nvim-lspconfig
          nvim-tree-lua
          nvim-treesitter
          telescope-nvim
          vim-commentary

          nim-vim
        ];
      };
    };
  };
in
  mkShell {
    packages = [
      neovim

       # for telescope-nvim
      ripgrep
      fd

      # for tree-sitter
      tree-sitter
      nodejs
      gcc

      nim
      nimlsp
    ];
  }
