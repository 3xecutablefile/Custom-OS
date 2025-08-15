{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "nebula-purple-base";
  version = "0-unstable-2025-06-21";

  src = fetchFromGitHub {
    owner = "nebula-OS";
    repo = "nebula-purple-base";
    rev = "76bdcda2fe04b9df4bcc80930644492adfc73764";
    hash = "sha256-+07xJGp+iwVp1v72HqCxIae1gW/P8dQrvZu2DbWfTXI=";
  };

  postPatch = ''
    substituteInPlace gnome-background-properties/*.xml \
      --replace-fail /usr/share/backgrounds $out/share/backgrounds
  '';

  installPhase = ''
    mkdir -p $out/share/{icons/hicolor/scalable/{apps,categories},backgrounds/nebula,gnome-background-properties}
    cp -r icons/apps/* $out/share/icons/hicolor/scalable/apps/
    cp -r icons/categories/* $out/share/icons/hicolor/scalable/categories/
    cp -r wallpapers/neon-circle.jpg $out/share/backgrounds/nebula/
    cp -r wallpapers/nix-neon-circle.jpg $out/share/backgrounds/nebula/
    cp -r gnome-background-properties/neon-circle.xml $out/share/gnome-background-properties/
    cp -r gnome-background-properties/nix-neon-circle.xml $out/share/gnome-background-properties/
  '';

  meta = with lib; {
    description = "Purple colorbase resources";
    homepage = "https://github.com/nebula-OS/nebula-purple-base";
    maintainers = with maintainers; [ d3vil0p3r ];
    platforms = platforms.unix;
    license = licenses.gpl3Plus;
  };
})
