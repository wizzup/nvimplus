{self,  pkgs ? import <nixpkgs> {} }:
with pkgs;
let
  neovim = pkgs.neovim.override {
    withPython3 = false;
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
        telescope-nvim
        nvim-treesitter
        nvim-lspconfig
        lsp_signature-nvim
        nvim-compe
        nvim-tree-lua

        gruvbox
        lualine-nvim
        vim-commentary
      ];
      opt = [ ];
      };
    };
  };
in
  mkShell {
    packages = [
      neovim
      tree-sitter
      nodejs

      python3
      pyright
      python3Packages.pylint
      python3Packages.pytest
    ];
  }
