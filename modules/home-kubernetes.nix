# Kubernetes tools configuration for home-manager
{ ... }:
{
  flake.modules.homeManager.kubernetes =
    { pkgs, ... }:
    {
      home.packages = builtins.attrValues {
        inherit (pkgs)
          helm
          k9s
          kubectl
          kubectx
          ;
      };
    };
}
