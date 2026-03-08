# Docker feature
{ ... }:
{
  flake.modules.nixos.docker =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    {
      virtualisation.docker.enable = true;

      # Integrate with Docker Desktop on Windows when running on WSL
      wsl.docker-desktop.enable = lib.mkIf (config.wsl.enable or false) true;
    };
}
