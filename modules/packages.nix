# System packages and programs feature
{ ... }:
{
  flake.modules.nixos.packages =
    { pkgs, ... }:
    {
      environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
          curl
          fd
          git
          gnumake
          htop
          jq
          nil # nix language server
          nixfmt
          ripgrep
          tailscale
          trash-cli
          tree
          uv
          wget
          yq
          zsh-z
          ;
      };

      programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
      };

      programs.tmux = {
        enable = true;
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
