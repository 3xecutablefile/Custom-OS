{ lib, pkgs, config, ... }: {
  config = lib.mkIf config.nebula.baseConfiguration {
    users.users.${config.nebula.homeManagerUser} = { extraGroups = [ "audio" ]; };

    # Sound settings
    security.rtkit.enable = true;
    environment.systemPackages = with pkgs; [ pulseaudio ];
    services.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };
}
