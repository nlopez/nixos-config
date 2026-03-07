# Home-manager configuration for the nixos user.
# This can be used both standalone and as a NixOS module.
{ config, ... }:
let
  inherit (config.flake.modules) homeManager;
in
{
  # Standalone home configuration (for use with `home-manager` command)
  configurations.home.nixos = {
    module = {
      imports = [
        homeManager.base
        homeManager.git
        homeManager.shell
      ];
    };
    username = "nixos";
    homeDirectory = "/home/nixos";
    system = "x86_64-linux";
  };
}
