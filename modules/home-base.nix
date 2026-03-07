# Basic home environment configuration
{ ... }:
{
  flake.modules.homeManager.base = {
    # Enable home-manager to manage itself
    programs.home-manager.enable = true;

    # Basic session variables
    home.sessionVariables = {
      EDITOR = "nvim";
      TZ = "America/New_York";
    };
  };
}
