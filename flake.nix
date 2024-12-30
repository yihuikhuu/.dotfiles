{
  description = "Nix systems and tools by yihuikhuu";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, darwin, nixpkgs, home-manager, ... }@inputs:
  let
    overlays = [];

    mkSystem = import ./lib/mksystem.nix {
      inherit overlays nixpkgs inputs;
    };
  in
  {
    darwinConfigurations.macbook-pro-m3-max = mkSystem "base-darwin" {
      system = "aarch64-darwin";
      user   = "yihuikhuu";
      darwin = true;
    };

    darwinConfigurations.macbook-pro-m1 = mkSystem "base-darwin" {
      system = "aarch64-darwin";
      user   = "yihuikhuu";
      darwin = true;
    };
  };
}
