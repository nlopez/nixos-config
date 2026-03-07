# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  environment.systemPackages = builtins.attrValues {
    inherit (pkgs) curl wget jq tailscale git;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  wsl.enable = true;
  wsl.defaultUser = "nixos";
  wsl.wslConf.network.generateHosts = false;
  wsl.wslConf.network.generateResolvConf = false;

  #Integrate with Docker Desktop on Windows
  wsl.docker-desktop.enable = true;
  users.users.nixos.extraGroups = [ "docker" ];

  networking.useDHCP = false;
  systemd.services."systemd-networkd".environment.SYSTEMD_LOG_LEVEL = "debug";
  services.resolved.enable = true;
  services.resolved.settings.Resolve.DNSSEC = "true";
  systemd.network.enable = true;
  systemd.network.networks."10-wan" = {
    matchConfig.Name = "eth0";
    networkConfig = {
      # start a DHCP Client for IPv4 Addressing/Routing
      DHCP = "ipv4";
      # accept Router Advertisements for Stateless IPv6 Autoconfiguraton (SLAAC)
      IPv6AcceptRA = true;
    };
    # make routing on this interface a dependency for network-online.target
    linkConfig.RequiredForOnline = "routable";
  };


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
