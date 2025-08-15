{ lib, config, ... }: {
  config = lib.mkIf config.nebula.baseConfiguration {
    home-manager.users.${config.nebula.homeManagerUser} = { pkgs, ...}: {
      # It copies "./config/menus/xfce-applications.menu" source file to the nix store, and then symlinks it to the location.
      xdg.configFile."menus/blue-applications.menu".source = ./config/menus/blue-applications.menu;
      xdg.configFile."menus/red-applications.menu".source = ./config/menus/red-applications.menu;
      xdg.configFile."menus/mitre-applications.menu".source = ./config/menus/mitre-applications.menu;
    };
  };
}
