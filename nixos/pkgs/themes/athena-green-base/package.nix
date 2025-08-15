{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "nebula-green-base";
  version = "0-unstable-2025-06-21";

  src = fetchFromGitHub {
    owner = "nebula-OS";
    repo = "nebula-green-base";
    rev = "6196603d37b44dd969bd005f94bdde7b215f726b";
    hash = "sha256-I3ltmMcTNyDNEBGyVyBP4fPjFPHEZ8oL9yMHQ1Vbjpo=";
  };

  postPatch = ''
    substituteInPlace gnome-background-properties/*.xml \
      --replace-fail /usr/share/backgrounds $out/share/backgrounds
  '';

  installPhase = ''
    mkdir -p $out/share/{icons/hicolor/scalable/{apps,categories},backgrounds/nebula,gnome-background-properties}
    cp -r icons/apps/* $out/share/icons/hicolor/scalable/apps/
    cp -r icons/categories/* $out/share/icons/hicolor/scalable/categories/
    cp -r wallpapers/hackthebox.png $out/share/backgrounds/nebula/
    cp -r wallpapers/nix-hackthebox.png $out/share/backgrounds/nebula/
    cp -r gnome-background-properties/hackthebox.xml $out/share/gnome-background-properties/
    cp -r gnome-background-properties/nix-hackthebox.xml $out/share/gnome-background-properties/
  '';

  meta = with lib; {
    description = "Green colorbase resources";
    homepage = "https://github.com/nebula-OS/nebula-green-base";
    maintainers = with maintainers; [ d3vil0p3r ];
    platforms = platforms.unix;
    license = licenses.gpl3Plus;
  };
})
