{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "nebula-cyan-base";
  version = "0-unstable-2025-06-21";

  src = fetchFromGitHub {
    owner = "nebula-OS";
    repo = "nebula-cyan-base";
    rev = "bbeb536c5a90ce6532f5e63ec7be7e10222a418a";
    hash = "sha256-VNbqs0w7CjDqeinaK/GgT77KzUrA6BrFiPUrzhhcu3I=";
  };

  postPatch = ''
    substituteInPlace gnome-background-properties/*.xml \
      --replace-fail /usr/share/backgrounds $out/share/backgrounds
  '';  

  installPhase = ''
    mkdir -p $out/share/{icons/hicolor/scalable/{apps,categories},backgrounds/nebula,gnome-background-properties}
    cp -r icons/apps/* $out/share/icons/hicolor/scalable/apps/
    cp -r icons/categories/* $out/share/icons/hicolor/scalable/categories/
    cp -r wallpapers/samurai-girl.jpg $out/share/backgrounds/nebula/
    cp -r wallpapers/temple.png $out/share/backgrounds/nebula/
    cp -r wallpapers/nike.png $out/share/backgrounds/nebula/
    cp -r wallpapers/nike-holo.png $out/share/backgrounds/nebula/
    cp -r gnome-background-properties/samurai-girl.xml $out/share/gnome-background-properties/
    cp -r gnome-background-properties/temple.xml $out/share/gnome-background-properties/
    cp -r gnome-background-properties/nike.xml $out/share/gnome-background-properties/
    cp -r gnome-background-properties/nike-holo.xml $out/share/gnome-background-properties/
  '';

  meta = with lib; {
    description = "Cyan colorbase resources";
    homepage = "https://github.com/nebula-OS/nebula-cyan-base";
    maintainers = with maintainers; [ d3vil0p3r ];
    platforms = platforms.unix;
    license = licenses.gpl3Plus;
  };
})
