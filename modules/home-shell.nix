# Basic shell configuration for home-manager
{ ... }:
{
  flake.modules.homeManager.shell = {
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
        };
      };
    };

    programs.starship.enable = true;
  };
}
