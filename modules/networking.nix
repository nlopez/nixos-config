# Networking configuration feature
{ ... }:
{
  flake.modules.nixos.networking = {
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
  };
}
