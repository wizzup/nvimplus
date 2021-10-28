{
  description = "neovim configured with haskell language server";
  nixConfig.bash-prompt = "\\W[py] ";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system;
    };
  in
  {
    devShell.${system} = pkgs.callPackage "${self}/shell.nix" {inherit self;};
  };
}
