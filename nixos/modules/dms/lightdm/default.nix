{ lib, config, ... }: {
  config = lib.mkIf (config.nebula.displayManager == "lightdm") {
    services.xserver.displayManager.lightdm = {
      enable = true;
      greeters.slick.enable = true;
    };
  };
}
