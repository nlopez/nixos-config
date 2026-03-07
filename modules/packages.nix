# System packages and programs feature
{ ... }:
{
  flake.modules.nixos.packages =
    { pkgs, ... }:
    {
      environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
          curl
          git
          gnumake
          jq
          nil
          nixfmt
          tailscale
          uv
          wget
          ;
      };

      programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
      };

      # https://nix-community.github.io/NixOS-WSL/how-to/vscode.html
      programs.nix-ld.enable = true;

      nix.settings.experimental-features = [
        "flakes"
        "nix-command"
        "pipe-operators"
      ];
    };
}
