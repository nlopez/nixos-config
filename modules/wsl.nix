# WSL configuration feature
{ ... }:
{
  flake.modules.nixos.wsl = {
    wsl.enable = true;
    wsl.defaultUser = "nixos";
    wsl.wslConf.network.generateHosts = false;
    wsl.wslConf.network.generateResolvConf = false;

    # Integrate with Docker Desktop on Windows
    wsl.docker-desktop.enable = true;
    users.users.nixos.extraGroups = [ "docker" ];
  };
}
