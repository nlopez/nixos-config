# Basic shell configuration for home-manager
{ ... }:
{
  flake.modules.homeManager.shell = {
    home.shell.enableZshIntegration = true;
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      zsh-abbr.enable = true;
    };

    programs.starship.enable = true;

    programs.atuin = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [ "--cmd cd" ];
    };

    programs.bat.enable = true;

    programs.tmux = {
      enable = true;
      mouse = true;
      sensibleOnTop = true; # https://github.com/tmux-plugins/tmux-sensible
      clock24 = true;
    };
  };

  flake.modules.homeManager.shellWsl = {
    programs.zsh.shellAliases = {
      ssh = "ssh.exe";
      op = "op.exe";
    };
  };
}
