# Kubernetes tools configuration for home-manager
{ ... }:
{
  flake.modules.homeManager.kubernetes =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      home.packages = builtins.attrValues {
        inherit (pkgs)
          helm
          k9s
          kubectl
          kubectx
          ;
      };

      programs.zsh.zsh-abbr.abbreviations = lib.mkIf config.programs.zsh.zsh-abbr.enable {
        k = "kubectl";
      };
    };
}
