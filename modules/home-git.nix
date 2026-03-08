# Git configuration for home-manager
{ ... }:
{
  flake.modules.homeManager.git =
    { config, lib, ... }:
    {
      programs.git = {
        enable = true;
        settings = {
          commit.gpgsign = true;
          core.autocrlf = "input"; # Convert CRLF to LF on commit, don't convert on checkout
          gpg.format = "ssh";
          init.defaultBranch = "main";
          pull.rebase = true;
          user.email = "20211302+nlopez@users.noreply.github.com";
          user.signingkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC6kTX4+xV3Xdo7QRHMIsZaZABV24Ini0/mcrGUfJeddpWzaD+63lI6h4Y9Pnrb1g/D5hvMUm/7AZ2BDiG+2/rJ3nTBdBqbNZXC5m9lLvn4G1uWDn7XmhBfZcXSv99vTHDzXSnHPLowkAT+CHBvT7ZEJZa5Xsmvtb1AQFZhw1U6DrahyXK09PDP41DImrb1Qb3yjSbyHLMzMZ0xroEVPqh3ncqLQH7+lXAxkt8Rn/GGUguhP71vPJgEOw3f81locrnhVERSErNC7BhxioQvPXQfjgK8ejx3YLo6pUYoELyAosekxeeWGR0ZZbWl6vBTB4rtea/N38HrWYfVTyMsF9u+7WTQoAAOhuQr7JUS+7ezBS+Elsva0rKmPdb5KMkHcEIKCEtxJC1V+gXY1g4Ij15k0/2dbnayn2oLboCI1jND945UEkgpajHMiLf1fgayocpyU8iREv5qFaztiTkCy11tv23W4tXDOESdtcHeTajKx8xj9WK+XzLnIu0A8DXWBCct7VGZEM8kRfa41OEIBQ7KFODpZgqMTGx3qC1gO+WZY3uKo6j/5GU/ZfCFs+6cMR60ctDVAholTCfhv2ihsyMfppm9vciwNw37wXrRT1UrM47pDgjPNJtMfchqzxf0zStIutuxfABzN6PLQGVkO6k2YXiFmzpHK4rr5JZl8RTQ9w==";
          user.name = "Nick Lopez";
        };
      };

      programs.zsh.zsh-abbr.abbreviations = lib.mkIf config.programs.zsh.zsh-abbr.enable {
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

  flake.modules.homeManager.gitWsl = {
    programs.git.settings = {
      core.sshCommand = "ssh.exe";
      credential.helper = "git-credential-manager.exe";
      gpg.ssh.program = "op-ssh-sign-wsl.exe";
    };
  };
}
