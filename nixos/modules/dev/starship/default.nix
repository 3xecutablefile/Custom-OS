{ lib, config, ...}: {
  config = lib.mkIf config.nebula.baseConfiguration {
    home-manager.users.${config.nebula.homeManagerUser} = { pkgs, ...}: {
      programs.starship = {
        enable = false;
        enableZshIntegration = false;
      };
    };
  };
}
