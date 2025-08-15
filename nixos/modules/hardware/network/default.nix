{ lib, config, ... }: {
  config = lib.mkIf config.nebula.baseConfiguration {
    networking.networkmanager.enable = true;
    services.vnstat.enable = true;
    users.users.${config.nebula.homeManagerUser} = {
      extraGroups = [ "networkmanager" ];
    };
  };
}
