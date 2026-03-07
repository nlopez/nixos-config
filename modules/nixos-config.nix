# Declares the NixOS configuration for the "nixos" host
{
  lib,
  config,
  inputs,
  ...
}:
let
  inherit (config.flake.modules) nixos homeManager;
in
{
  configurations.nixos.nixos.module = {
    imports = [
      inputs.nixos-wsl.nixosModules.default
      inputs.home-manager.nixosModules.default
      nixos.wsl
      nixos.packages
      nixos.networking
    ];

    # Configure home-manager as a NixOS module
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
      users.nixos =
        { osConfig, ... }:
        {
          imports = [
            homeManager.base
            homeManager.git
            homeManager.shell
          ]
          ++ lib.optionals osConfig.wsl.enable [
            homeManager.gitWsl
            homeManager.shellWsl
          ];
          home.stateVersion = "25.11";
        };
    };

    nixpkgs.hostPlatform = "x86_64-linux";
    nixpkgs.config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "zsh-abbr"
      ];

    time.timeZone = "UTC";

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It's perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.11"; # Did you read the comment?
  };
}
