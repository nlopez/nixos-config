# Git configuration for home-manager
{ ... }:
{
  flake.modules.homeManager.git = {
    programs.git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        pull.rebase = true;
      };
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
