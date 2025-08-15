{ lib, config, ... }: {
  imports = [
    ./bash
    ./fish
    ./powershell
    ./zsh
  ];

  config = lib.mkIf config.nebula.baseConfiguration {
    home-manager.users.${config.nebula.homeManagerUser} = { pkgs, ...}: {
      home.file.".bash_aliases".source = ./bash_aliases;
      # home.packages = with pkgs; [
      #   fastfetch
      #   zoxide
      # ];

      xdg.desktopEntries."shell" = {
        type = "Application";
        name = "Shell";
        comment = "Shell";
        icon = "shell";
        exec = "${config.nebula.terminal}";
        terminal = false;
        categories = [ "Application" "Utility" ];
      };
    };
  };
}
