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
      zsh-abbr = {
        enable = true;
        abbreviations = {
          g = "git";
          ga = "git add";
          gc = "git commit";
          gcd = "git checkout \"$(git remote show origin | sed -n 's/.*HEAD branch: \(.*\)/\1/p')\"";
          gdc = "git diff --cached";
          gp = "git push";
          grc = "git rebase --continue";
          grhh = "git reset --hard HEAD";
          gst = "git status";
          gup = "git pull --rebase";
          gconf = "git config --list --show-origin --show-scope --includes";
        };
      };
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
