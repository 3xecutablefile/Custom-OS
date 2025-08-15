{ lib, config, ... }: {
  config = lib.mkIf (config.nebula.bootloader == "grub") {
    # Bootloader
    boot.loader = {
      grub = {
        device = "/dev/sda";
        enableCryptodisk = true;
        configurationLimit = 5;
      };
    };
  };
}
