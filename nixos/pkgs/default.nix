{ lib, pkgs, config, ... }:
{
  environment.systemPackages = lib.mkIf config.nebula.baseConfiguration (with pkgs; [
    (callPackage ./nebula-config-nix/package.nix { })
    (callPackage ./nebula-welcome/package.nix { })
    (callPackage ./nist-feed/package.nix { })
    (callPackage ./gemini-cli-interpreter { })
  ]);
}
