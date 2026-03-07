# Provides an option for declaring home-manager configurations.
# These configurations can be used both standalone and as NixOS modules.
# Standalone configs end up as flake outputs under `#homeConfigurations."<name>"`.
{
  lib,
  config,
  inputs,
  ...
}:
{
  options.configurations.home = lib.mkOption {
    type = lib.types.lazyAttrsOf (
      lib.types.submodule {
        options = {
          module = lib.mkOption {
            type = lib.types.deferredModule;
            description = "Home-manager configuration module";
          };
          username = lib.mkOption {
            type = lib.types.str;
            description = "Username for this home configuration";
          };
          homeDirectory = lib.mkOption {
            type = lib.types.str;
            description = "Home directory path";
          };
          system = lib.mkOption {
            type = lib.types.str;
            description = "System architecture (e.g., x86_64-linux)";
          };
        };
      }
    );
    default = { };
  };

  config.flake = {
    # Standalone home-manager configurations
    homeConfigurations = lib.flip lib.mapAttrs config.configurations.home (
      name:
      {
        module,
        username,
        homeDirectory,
        system,
      }:
      inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        modules = [
          module
          {
            home = {
              inherit username homeDirectory;
              stateVersion = "25.11";
            };
          }
        ];
      }
    );
  };
}
